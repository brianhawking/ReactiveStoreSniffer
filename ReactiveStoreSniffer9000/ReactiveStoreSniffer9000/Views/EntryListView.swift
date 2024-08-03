//
//  EntryListView.swift
//  ReactiveStoreSniffer9000
//
//  Created by Brian Veitch on 8/2/24.
//

import Foundation
import SwiftUI

struct EntryListView: View {
    @EnvironmentObject var webSocketServer: WebSocketServer
    @State private var selectedEntry: Entry?
    @State private var filterText: String = ""
    @State private var selectedEventType: String = "All"
    
    private var eventTypes = ["All", "Action", "Analytics", "State"]
    
    private var entries: [Entry] {
        let allEntries = webSocketServer.logEntries.isEmpty ? mockEntries : webSocketServer.logEntries
        return filteredEntries(from: allEntries)
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Filter by feature name", text: $filterText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button(action: {
                    if webSocketServer.isRunning {
                        webSocketServer.stopServer()
                    } else {
                        webSocketServer.startServer()
                    }
                }) {
                    Text(webSocketServer.isRunning ? "Stop Server" : "Start Server")
                }
                .padding()
                Button(action: {
                    webSocketServer.clearEntries()
                }) {
                    Text("Clear Entries")
                }
                .padding()
            }
            
            Picker("Event Type", selection: $selectedEventType) {
                ForEach(eventTypes, id: \.self) { eventType in
                    Text(eventType).tag(eventType)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            HStack {
                Text("Timestamp")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Feature")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Event Type")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Summary")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding([.leading, .trailing, .top])
            
            Divider()
            
            List(entries.indices, id: \.self) { index in
                let entry = entries[index]
                Button(action: {
                    selectedEntry = entry
                }) {
                    HStack {
                        Text(dateFormatter.string(from: entry.timestamp))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(entry.featureName)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(entry.eventType)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(entry.summary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineLimit(1)
                    }
                    .padding()
                    .background(index % 2 == 0 ? Color.gray.opacity(0.1) : Color(.secondarySystemBackground))
                }
                .buttonStyle(PlainButtonStyle())
                .listRowInsets(EdgeInsets()) // Remove default insets
            }
            .listStyle(PlainListStyle())
            
            Divider()
            
            if let selectedEntry = selectedEntry {
                EntryDetailView(entry: selectedEntry)
                    .padding()
            } else {
                Text("Select an entry to see details")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
            }
        }
    }
    
    private func filteredEntries(from entries: [Entry]) -> [Entry] {
        let textFilteredEntries = filterText.isEmpty ? entries : entries.filter { $0.featureName.lowercased().contains(filterText.lowercased()) }
        
        if selectedEventType == "All" {
            return textFilteredEntries
        } else {
            return textFilteredEntries.filter { $0.eventType.lowercased() == selectedEventType.lowercased() }
        }
    }
}
