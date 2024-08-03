//
//  ContentView.swift
//  ReactiveStoreApp
//
//  Created by Brian Veitch on 8/2/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var webSocketClient = WebSocketClient()
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Send Log Entry") {
                let entry = Entry(
                    id: UUID(),
                    timestamp: Date(),
                    eventType: "Analytics",
                    featureName: "Referrals",
                    summary: "Referrals displayed",
                    details: .log(LogDetails(logLevel: "info", logMessage: "Referrals displayed:savor:primary:personal:contentId-1"))
                )
                webSocketClient.send(entry: entry)
            }
            .buttonStyle(PrimaryButtonStyle())
            
            Button("Send State Entry") {
                let entry = Entry(
                    id: UUID(),
                    timestamp: Date(),
                    eventType: "State",
                    featureName: "Referrals",
                    summary: "{\"loadingState\": \".loaded(1)\", \"account\": \"Account\"}",
                    details: .state(StateDetails(stateData: "{\"loadingState\": \".loaded(1)\", \"account\": \"Account\"}"))
                )
                webSocketClient.send(entry: entry)
            }
            .buttonStyle(PrimaryButtonStyle())
            
            Button("Send Action Entry") {
                let entry = Entry(
                    id: UUID(),
                    timestamp: Date(),
                    eventType: "Action",
                    featureName: "Referrals",
                    summary: "setLoaded(.show(1))",
                    details: .action(ActionDetails(actionType: "setLoaded(.show(1))", payload: "{\"contentId\": \"1\"}"))
                )
                webSocketClient.send(entry: entry)
            }
            .buttonStyle(PrimaryButtonStyle())
            
            Spacer()
            
            if webSocketClient.isConnected {
                Text("Connected to WebSocket server")
                    .foregroundColor(.green)
            } else {
                Text("Disconnected from WebSocket server")
                    .foregroundColor(.red)
            }
        }
        .padding()
        .onAppear {
            webSocketClient.connect()
        }
        .onDisappear {
            webSocketClient.disconnect()
        }
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}


#Preview {
    ContentView()
}
