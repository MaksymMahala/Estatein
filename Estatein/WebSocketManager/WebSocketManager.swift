//
//  SocketClient.swift
//  Minus1
//
//  Created by Max on 01.10.2024.
//

import Foundation
import SocketIO
import Combine

class WebSocketManager: ObservableObject {
    @Published var price: String = ""
    @Published var symbol: String = "BTC"

    private var webSocketTask: URLSessionWebSocketTask?
    private var cancellables = Set<AnyCancellable>()

    init() {
        connect()
    }

    func connect() {
        let url = URL(string: Constants.WebSocketURLServer.webSocketURLServer)!
        webSocketTask = URLSession.shared.webSocketTask(with: url)
        webSocketTask?.resume()
        listen()
    }

    private func listen() {
        webSocketTask?.receive { [weak self] result in
            switch result {
            case .success(let message):
                switch message {
                case .string(let text):
                    self?.handleMessage(text)
                default:
                    break
                }
            case .failure(let error):
                print("Error receiving message: \(error)")
            }
            self?.listen() 
        }
    }

    private func handleMessage(_ text: String) {
        if let data = text.data(using: .utf8) {
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let price = json["price"] as? String,
                   let symbol = json["symbol"] as? String {
                    DispatchQueue.main.async {
                        self.price = price
                        self.symbol = symbol
                    }
                }
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }
    }

    func disconnect() {
        webSocketTask?.cancel(with: .normalClosure, reason: nil)
    }
}
