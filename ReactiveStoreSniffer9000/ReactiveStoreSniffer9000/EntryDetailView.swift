//
//  EntryDetailView.swift
//  ReactiveStoreSniffer9000
//
//  Created by Brian Veitch on 8/2/24.
//

import Foundation
import SwiftUI

struct EntryDetailView: View {
    let entry: Entry
    private let fixedHeight: CGFloat = 200 // Set your desired fixed height here
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Feature: \(entry.featureName)")
                .font(.headline)
            Text("Event Type: \(entry.eventType)")
                .font(.subheadline)
            Text("Timestamp: \(dateFormatter.string(from: entry.timestamp))")
                .font(.subheadline)
            Text("Summary: \(entry.summary)")
                .font(.subheadline)
                .padding(.bottom)
            
            Divider()
            
            GeometryReader { geometry in
                ScrollView {
                    VStack(alignment: .leading) {
                        switch entry.details {
                        case .action(let actionDetails):
                            Text("Action Type: \(actionDetails.actionType)")
                            Text("Payload:\n \(prettyPrintJSON(from: actionDetails.payload))")
                        case .log(let logDetails):
                            Text("Log Level: \(logDetails.logLevel)")
                            Text("Log Message: \(logDetails.logMessage)")
                        case .state(let stateDetails):
                            Text("State Data: \(prettyPrintJSON(from: stateDetails.stateData))")
                        }
                    }
                    .frame(width: geometry.size.width, alignment: .leading)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                }
                .frame(height: fixedHeight)
            }
            .frame(height: fixedHeight)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func prettyPrint(json: [String: Any]) -> String {
        guard let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted),
              let jsonString = String(data: jsonData, encoding: .utf8) else {
            return "{}"
        }
        return jsonString
    }
    
    func prettyPrintJSON(from jsonString: String) -> String {
        guard let data = jsonString.data(using: .utf8) else {
            return jsonString
        }
        
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            let prettyData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
            
            if let prettyString = String(data: prettyData, encoding: .utf8) {
                return prettyString
            } else {
                return jsonString
            }
        } catch {
            return jsonString
        }
    }
}


