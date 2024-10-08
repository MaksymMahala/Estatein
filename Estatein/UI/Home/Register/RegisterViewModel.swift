//
//  RegisterViewModel.swift
//  Minus1
//
//  Created by Max on 08.10.2024.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var showVerificationCodeView = false
    
    var email = AppPreferenceManager.shared.getString(key: "email")
}
