//  SocketClient.swift
//  Minus1
//
//  Created by Max on 01.10.2024.
//

import Foundation
import Combine

class WebSocketManager: ObservableObject {
    @Published var prices: [String: String] = [:]
    private var webSocketTask: URLSessionWebSocketTask?
    
    // Connect to the WebSocket server
    func connect() {
        let url = URL(string: "ws://localhost:8080")!
        webSocketTask = URLSession.shared.webSocketTask(with: url)
        webSocketTask?.resume()
        print("Connected to WebSocket server")
    }
    
    // Subscribe to the Spot stream
    func subscribeToSpot() {
        connect()
        let subscribeMessage = "{\"type\": \"spot\"}"
        sendMessage(subscribeMessage)
        receiveMessages()
    }
    
    // Subscribe to the Futures stream
    func subscribeToFutures() {
        connect()
        let subscribeMessage = "{\"type\": \"futures\"}"
        sendMessage(subscribeMessage)
        receiveMessages()
    }
    
    // Function to send a message over WebSocket
    private func sendMessage(_ message: String) {
        let messageToSend = URLSessionWebSocketTask.Message.string(message)
        webSocketTask?.send(messageToSend) { error in
            if let error = error {
                print("Error sending message: \(error.localizedDescription)")
            }
        }
    }
    
    // Receive messages from the WebSocket server
    private func receiveMessages() {
        webSocketTask?.receive { [weak self] result in
            switch result {
            case .failure(let error):
                print("WebSocket error: \(error.localizedDescription)")
                self?.reconnect() 
            case .success(let message):
                switch message {
                case .string(let text):
                    self?.processMessage(text: text)
                default:
                    break
                }
            }
            // Continue receiving messages
            self?.receiveMessages()
        }
    }
    
    // Process incoming messages
    private func processMessage(text: String) {
        if let data = text.data(using: .utf8) {
            do {
                let priceUpdate = try JSONDecoder().decode(PriceUpdate.self, from: data)
                DispatchQueue.main.async {
                    self.prices[priceUpdate.symbol] = priceUpdate.price
                }
            } catch {
                print("Error decoding message: \(error)")
            }
        }
    }
    
    private func reconnect() {
        print("Attempting to reconnect...")
        disconnect()
        connect()
    }
    
    // Disconnect from the WebSocket server
    func disconnect() {
        webSocketTask?.cancel(with: .goingAway, reason: nil)
        print("Disconnected from WebSocket server")
    }
}

struct PriceUpdate: Codable {
    let type: String
    let symbol: String
    let price: String
}
