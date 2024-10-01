//
//  HomeViewModel.swift
//  Estatein
//
//  Created by Max on 30.09.2024.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    var menuButtonImage = ["deposit-Icon", "referral-Icon", "chart-Icon", "settings-Icon", "launchpad-Icon", "wallet-Icon", "exchange-Icon", "more-Icon"]
    var menuButtonText = ["Deposit", "Referral", "Grid Trading", "Margin", "Launchpad", "Savings", "Liquid Swap", "More"]

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
}
