//
//  ContentView.swift
//  ReactiveStoreSniffer9000
//
//  Created by Brian Veitch on 8/2/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var webSocketServer = WebSocketServer()
    var body: some View {
        EntryListView()
            .environmentObject(webSocketServer)
    }
}

#Preview {
    ContentView()
}
