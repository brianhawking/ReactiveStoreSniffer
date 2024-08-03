//
//  WebSocketClient.swift
//  ReactiveStoreApp
//
//  Created by Brian Veitch on 8/2/24.
//

import Foundation
import Combine

class WebSocketClient: ObservableObject {
    private var webSocketTask: URLSessionWebSocketTask?
    private let urlSession = URLSession(configuration: .default)
    
    @Published var isConnected: Bool = false
    
    func connect() {
        guard let url = URL(string: "ws://localhost:8080") else { return }
        webSocketTask = urlSession.webSocketTask(with: url)
        webSocketTask?.resume()
        isConnected = true
        receiveMessage()
    }
    
    func disconnect() {
        webSocketTask?.cancel(with: .goingAway, reason: nil)
        isConnected = false
    }
    
    func send(entry: Entry) {
        guard let webSocketTask = webSocketTask else { return }
        
        do {
            let data = try JSONEncoder().encode(entry)
            let message = URLSessionWebSocketTask.Message.data(data)
            webSocketTask.send(message) { error in
                if let error = error {
                    print("WebSocket sending error: \(error)")
                }
            }
        } catch {
            print("WebSocket encoding error: \(error)")
        }
    }
    
    private func receiveMessage() {
        webSocketTask?.receive { [weak self] result in
            switch result {
            case .failure(let error):
                print("WebSocket receiving error: \(error)")
                self?.isConnected = false
            case .success:
                self?.receiveMessage()
            }
        }
    }
}

