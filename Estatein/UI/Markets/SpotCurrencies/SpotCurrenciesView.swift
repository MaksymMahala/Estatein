//
//  SpotCurrenciesView'.swift
//  Minus1
//
//  Created by Max on 02.10.2024.
//

import SwiftUI

struct SpotCurrenciesView: View {
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
            webSocketManager.subscribeToSpot()
            viewModel.fetchCryptocurrencies()
        }
        .onDisappear {
            webSocketManager.disconnect()
        }
    }
}

struct SpotCurrenciesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SpotCurrenciesView()
                .previewDevice("iPhone 16 Pro")
                .previewDisplayName("iPhone 16 Pro")
            
            SpotCurrenciesView()
                .previewDevice("iPhone SE")
                .previewDisplayName("iPhone SE")
        }
    }
}
