//
//  CashManagementViewModel.swift
//  Minus1
//
//  Created by Max on 09.10.2024.
//

import Foundation

class CashManagementViewModel: ObservableObject {
    @Published var selectedIndex = 0

    let caregoryManagement = ["Deposit", "Withdraw", "Transfer"]
}
