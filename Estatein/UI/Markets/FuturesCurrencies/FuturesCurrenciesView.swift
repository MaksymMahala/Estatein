//
//  FuturesCurrencies.swift
//  Minus1
//
//  Created by Max on 02.10.2024.
//

import SwiftUI

struct FuturesCurrenciesView: View {
    @StateObject private var webSocketManager = WebSocketManager()
    @StateObject private var viewModel = CryptoCompactInfoViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(viewModel.cryptocurrencies, id: \.id) { cryptocurrency in
                    CryptoCurrenciesCell(webSocketManager: webSocketManager, symbol: cryptocurrency.symbol, cryptocurrency: cryptocurrency)
                }
            }
        }
        .padding(.vertical)
        .onAppear {
            viewModel.fetchCryptocurrencies()
            webSocketManager.subscribeToFutures()
        }
        .onDisappear {
            webSocketManager.disconnect()
        }
    }
}

struct FuturesCurrenciesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FuturesCurrenciesView()
                .previewDevice("iPhone 16 Pro")
                .previewDisplayName("iPhone 16 Pro")
            
            FuturesCurrenciesView()
                .previewDevice("iPhone SE")
                .previewDisplayName("iPhone SE")
        }
    }
}
