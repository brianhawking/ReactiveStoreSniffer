//
//  WebSocketServer.swift
//  ReactiveStoreSniffer9000
//
//  Created by Brian Veitch on 8/2/24.
//

import Network
import SwiftUI

class WebSocketServer: ObservableObject {
    @Published var logEntries: [Entry] = []
    @Published var isRunning: Bool = false

    private var listener: NWListener?
    private var connections = [NWConnection]()

    init() {
        startServer()
    }

    func startServer() {
        do {
            let params = NWParameters.tcp
            let websocketOptions = NWProtocolWebSocket.Options()
            params.defaultProtocolStack.applicationProtocols.insert(websocketOptions, at: 0)
            
            listener = try NWListener(using: params, on: 8080) // WebSocket server port
            listener?.newConnectionHandler = { [weak self] connection in
                self?.setupConnection(connection)
            }
            listener?.start(queue: .main)
            isRunning = true
            print("Server started on port 8080")
        } catch {
            print("Failed to start listener: \(error)")
        }
    }

    func stopServer() {
        listener?.cancel()
        listener = nil
        closeAllConnections()
        isRunning = false
        print("Server stopped")
    }

    private func setupConnection(_ connection: NWConnection) {
        connections.append(connection)
        connection.stateUpdateHandler = { [weak self] newState in
            switch newState {
            case .ready:
                print("Client connected: \(connection)")
                self?.receiveMessage(on: connection)
            case .failed(let error):
                print("Connection failed: \(error)")
                self?.removeConnection(connection)
            case .cancelled:
                print("Client disconnected: \(connection)")
                self?.removeConnection(connection)
            default:
                break
            }
        }
        connection.start(queue: .main)
    }

    private func receiveMessage(on connection: NWConnection) {
        connection.receiveMessage { [weak self] (data, context, isComplete, error) in
            if let data = data, let logEntry = try? JSONDecoder().decode(Entry.self, from: data) {
                DispatchQueue.main.async {
                    print("Received log entry: \(logEntry)")
                    self?.logEntries.append(logEntry)
                }
            } else {
                print("Failed to receive message or decode log entry")
            }
            if error == nil {
                self?.receiveMessage(on: connection)
            } else {
                print("Error receiving message: \(String(describing: error))")
            }
        }
    }
    
    func clearEntries() {
        logEntries.removeAll()
    }

    func closeConnection(_ connection: NWConnection) {
        connection.cancel()
    }

    func closeAllConnections() {
        connections.forEach { $0.cancel() }
        connections.removeAll()
    }

    private func removeConnection(_ connection: NWConnection) {
        connections.removeAll { $0 === connection }
    }

    deinit {
        closeAllConnections()
    }
}

