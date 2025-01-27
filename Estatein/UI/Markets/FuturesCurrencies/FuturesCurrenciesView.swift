//
//  FuturesCurrencies.swift
//  Minus1
//
//  Created by Max on 02.10.2024.
//

import SwiftUI

struct FuturesCurrenciesView: View {
    @StateObject private var viewModel = CryptoCompactInfoViewModel(cryptoCurrencyService: CryptoCurrencyService(networkService: NetworkService()))
    @Binding var prices: [String: String]

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(viewModel.cryptocurrencies, id: \.id) { cryptocurrency in
                    CryptoCurrenciesCell(prices: prices, symbol: cryptocurrency.symbol, cryptocurrency: cryptocurrency)
                }
            }
        }
        .padding(.vertical)
        .onAppear {
            viewModel.fetchCryptocurrencies()
        }
    }
}
