//
//  GroupedCoinsSection.swift
//  Minus1
//
//  Created by Max on 02.10.2024.
//

import SwiftUI

struct GroupedCoinsSection: View {
    @StateObject private var webSocketManager = WebSocketClient()
    @StateObject private var viewModel = CryptoCompactInfoViewModel(cryptoCurrencyService: CryptoCurrencyService(networkService: NetworkService()))

    var body: some View {
        VStack {
            recentCoins
            
            topCoins
        }
        .onDisappear {
            webSocketManager.disconnectWebSocket()
        }
    }
    
    private var recentCoins: some View {
        VStack(alignment: .leading) {
            Text("Recent Coins")
                .font(Font.soraBold20)
            
            RecentCoinsView(webSocketManager: webSocketManager, viewModel: viewModel)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }

    private var topCoins: some View {
        VStack(alignment: .leading) {
            Text("Top Coins")
                .font(Font.soraBold20)
            
            TopCoinsView(webSocketManager: webSocketManager, viewModel: viewModel)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct GroupedCoinsSection_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GroupedCoinsSection()
                .previewDevice("iPhone 16 Pro")
                .previewDisplayName("iPhone 16 Pro")
            
            GroupedCoinsSection()
                .previewDevice("iPhone SE")
                .previewDisplayName("iPhone SE")
        }
    }
}
