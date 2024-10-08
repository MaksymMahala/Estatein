//
//  VerificationCodeViewModel.swift
//  Minus1
//
//  Created by Max on 08.10.2024.
//

import Foundation

class VerificationCodeViewModel: ObservableObject {
    @Published var showSubmitRegistration = false
    @Published var otp = ""
    private var appPreferenceManager = AppPreferenceManager.shared
    
    func verifyOtp(completion: @escaping () -> ()) {
        let email = appPreferenceManager.getString(key: "email")
        
        guard let url = URL(string: "http://localhost:5500/api/verify-otp") else {
            print("Invalid URL")
            return
        }
        
        let parameters: [String: Any] = [
            "email": email,
            "otp": otp
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
                        print("Response: \(jsonResponse)")
                        DispatchQueue.main.async {
                            completion()
                        }
                    }
                } catch {
                    print("Error: Unable to parse JSON response")
                }
            }
        }
        task.resume()
    }
}
