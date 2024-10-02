//
//  TopCoinsView.swift
//  Minus1
//
//  Created by Max on 02.10.2024.
//

import SwiftUI

struct TopCoinsView: View {
    @ObservedObject var webSocketManager: WebSocketManager
    @ObservedObject var viewModel: CryptoCompactInfoViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.topCryptocurrencies, id: \.id) { cryptocurrency in
                    CoinCell(webSocketManager: webSocketManager, viewModel: viewModel, symbol: cryptocurrency.symbol, cryptocurrency: cryptocurrency)
                }
            }
        }
        .onAppear {
            viewModel.fetchTopCryptocurrencies()
        }
    }
}

struct TopCoinsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TopCoinsView(webSocketManager: WebSocketManager(), viewModel: CryptoCompactInfoViewModel())
                .previewDevice("iPhone 16 Pro")
                .previewDisplayName("iPhone 16 Pro")
            
            TopCoinsView(webSocketManager: WebSocketManager(), viewModel: CryptoCompactInfoViewModel())
                .previewDevice("iPhone SE")
                .previewDisplayName("iPhone SE")
        }
    }
}
