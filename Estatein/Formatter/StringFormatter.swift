//
//  Formatter.swift
//  Minus1
//
//  Created by Max on 01.10.2024.
//

import Foundation

class StringFormatter {
    static let shared = StringFormatter()
    
    func formatPrice(_ price: String) -> String {
        guard let price = Double(price) else {
            return "N/A"
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter.string(from: NSNumber(value: price)) ?? "\(price)"
    }
}
