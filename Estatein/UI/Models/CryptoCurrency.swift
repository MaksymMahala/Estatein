//
//  CurrencyJSONModel.swift
//  Minus1
//
//  Created by Max on 01.10.2024.
//

import Foundation

struct CryptoCurrency: Identifiable, Codable {
    let id: Int
    let symbol: String
    let name: String
    let icon: String
}
