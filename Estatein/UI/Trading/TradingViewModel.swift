//
//  TradingViewModel.swift
//  Minus1
//
//  Created by Max on 17.10.2024.
//

import Foundation

class TradingViewModel: ObservableObject {
    @Published var selectedOrder = 0
    @Published var selectValue = 0
    var orderCategoties = ["Open Order", "Order Books", "Market Trades"]
}
