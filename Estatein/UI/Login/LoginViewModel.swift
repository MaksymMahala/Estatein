//
//  LoginViewModel.swift
//  Minus1
//
//  Created by Max on 08.10.2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var selectedIndex = 0
    @Published var showRegisterView = false
    @Published var showMainView = false

    private var appPreferenceManager = AppPreferenceManager.shared
    
    func sendOtp() {
        guard let url = URL(string: "http://localhost:5500/api/send-otpcode") else {
            print("Invalid URL")
            return
        }
        
        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            print("Error: Unable to convert parameters to JSON data")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Error: Invalid response from server")
                return
            }
            
            if let data = data {
                do {
                    if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        self.appPreferenceManager.saveString(value: self.email, key: "email")
                        self.appPreferenceManager.saveString(value: self.password, key: "password")
                        DispatchQueue.main.async {
                            self.showRegisterView = true
                        }
                        print("Response: \(jsonResponse)")
                    }
                } catch {
                    print("Error: Unable to parse JSON response")
                }
            }
        }
        task.resume()
    }
    
    func loginIn() {
        guard let url = URL(string: "http://localhost:5500/api/loginUser") else {
            print("Invalid URL")
            return
        }
        
        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            print("Error: Unable to convert parameters to JSON data")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Error: Invalid response from server")
                return
            }
            
            if let data = data {
                do {
                    if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        self.appPreferenceManager.saveString(value: self.email, key: "email")
                        self.appPreferenceManager.saveString(value: self.password, key: "password")
                        DispatchQueue.main.async {
                            self.showMainView = true
                        }
                        print("Response: \(jsonResponse)")
                    }
                } catch {
                    print("Error: Unable to parse JSON response")
                }
            }
        }
        task.resume()
    }
    
    
}
