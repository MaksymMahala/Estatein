//
//  RecentCoinCell.swift
//  Minus1
//
//  Created by Max on 01.10.2024.
//

import Foundation
import SwiftUI

struct CoinCell: View {
    @ObservedObject var webSocketManager: WebSocketManager
    @ObservedObject var viewModel: CryptoCompactInfoViewModel
    var stringFormatter = StringFormatter.shared
    var symbol: String
    var cryptocurrency: CryptoCurrencyCompactInfo
    
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 160, height: 150)
                .foregroundStyle(Color.white)
                .shadow(color: .gray, radius: 3)
                .padding(5)
            VStack {
                HStack {
                    Text("$\(stringFormatter.formatPrice(webSocketManager.prices[symbol] ?? "N/A"))")
                        .font(Font.soraBold12)
                        .foregroundStyle(Color.greenGrass)
                    
                    AsyncImage(url: URL(string: cryptocurrency.icon)) { image in
                        image.resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .padding(.leading, 5)
                    } placeholder: {
                        ProgressView()
                    }
                }
                .frame(width: 110, alignment: .leading)
                .padding(.vertical)
                
                VStack(alignment: .leading) {
                    Text(cryptocurrency.name)
                        .foregroundStyle(Color.black)
                    Text(symbol).font(.orbitronRegular12).foregroundColor(.gray)
                }
                .font(Font.orbitronRegular14)
                .frame(width: 110, height: 3, alignment: .leading)
                
                VStack(alignment: .leading) {
                    Text("Graph")
                        .foregroundStyle(Color.green)
                }
                .frame(width: 110, height: 30, alignment: .leading)
                .padding(.top, 30)
            }
        }
    }
}
