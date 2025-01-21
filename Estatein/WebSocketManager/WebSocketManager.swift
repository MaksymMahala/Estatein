import SwiftUI
import Combine

class WebSocketClient: ObservableObject {
    private var webSocketTask: URLSessionWebSocketTask?
    private let webSocketURL = URL(string: Constants.WebSocketURLServer.webSocketURLServer + "ws/all-currency-ticker")!
    
    @Published var prices: [String: String] = [:]
    
    init() {
        connectWebSocket()
    }
    
    func connectWebSocket() {
        let urlSession = URLSession(configuration: .default)
        webSocketTask = urlSession.webSocketTask(with: webSocketURL)
        webSocketTask?.resume()
        receiveMessages()
    }
    
    private func receiveMessages() {
        webSocketTask?.receive { [weak self] result in
            switch result {
            case .success(let message):
                switch message {
                case .string(let text):
                    self?.handleMessage(text)
                case .data(let data):
                    print("Received binary data: \(data)")
                @unknown default:
                    print("Received unknown message type")
                }
            case .failure(let error):
                print("Error receiving message: \(error)")
            }
            
            self?.receiveMessages()
        }
    }
    
    private func handleMessage(_ text: String) {
        if let data = text.data(using: .utf8),
           let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
           let symbol = json["Symbol"] as? String,
           let closePrice = json["ClosePrice"] as? Double {
            DispatchQueue.main.async {
                self.prices[symbol] = String(format: "%.6f", closePrice)
            }
        } else {
            print("Failed to parse message: \(text)")
        }
    }
    
    func sendMessage(_ message: String) {
        let message = URLSessionWebSocketTask.Message.string(message)
        webSocketTask?.send(message) { error in
            if let error = error {
                print("Error sending message: \(error)")
            }
        }
    }
    
    func disconnectWebSocket() {
        webSocketTask?.cancel(with: .goingAway, reason: nil)
    }
}
