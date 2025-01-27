//
//  CryptoMarketCell.swift
//  Minus1
//
//  Created by Max on 02.10.2024.
//

import Foundation
import SwiftUI

struct CryptoCurrenciesCell: View {
    var prices: [String: String]
    var stringFormatter = StringFormatter.shared
    var symbol: String
    var cryptocurrency: CryptoCurrencyCompactInfo
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: cryptocurrency.icon)) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .padding(.leading, 5)
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                Text(cryptocurrency.name)
                    .font(Font.soraMedium15)
                    .foregroundStyle(Color.white)
                
                Text(symbol)
                    .font(Font.orbitronRegular12)
                    .foregroundStyle(Color.gray)
                
            }
            .padding(.horizontal, 5)
            
            Spacer()
            
            Text("$\(stringFormatter.formatPrice(prices[symbol] ?? cryptocurrency.price))")
                .font(Font.soraBold15)
                .foregroundStyle(Color.white)
        }
        .frame(height: 70)
        .padding(.horizontal)
    }
}
