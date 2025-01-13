//
//  PriceView.swift
//  Minus1
//
//  Created by Max on 01.10.2024.
//

import SwiftUI

struct RecentCoinsView: View {
    @ObservedObject var webSocketManager: WebSocketClient
    @ObservedObject var viewModel: CryptoCompactInfoViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.recentCryptocurrencies, id: \.id) { cryptocurrency in
                    CoinCell(webSocketManager: webSocketManager, viewModel: viewModel, symbol: cryptocurrency.symbol, cryptocurrency: cryptocurrency)
                }
            }
        }
        .onAppear {
            viewModel.fetchRecentCryptocurrencies()
        }
    }
}
