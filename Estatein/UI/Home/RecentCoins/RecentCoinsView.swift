//
//  PriceView.swift
//  Minus1
//
//  Created by Max on 01.10.2024.
//

import SwiftUI

struct RecentCoinsView: View {
    @StateObject private var webSocketManager = WebSocketManager()
    @StateObject private var viewModel = CryptoViewModel()

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.cryptocurrencies) { crypto in
                    RecentCoinCell(webSocketManager: webSocketManager, viewModel: viewModel, crypto: crypto)
                }
            }
        }
        .onDisappear {
            webSocketManager.disconnect()
        }
        .onAppear {
            viewModel.fetchCryptocurrencies()
        }
    }
}

struct RecentCoinsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecentCoinsView()
                .previewDevice("iPhone 16 Pro")
                .previewDisplayName("iPhone 16 Pro")
            
            RecentCoinsView()
                .previewDevice("iPhone SE")
                .previewDisplayName("iPhone SE")
        }
    }
}
