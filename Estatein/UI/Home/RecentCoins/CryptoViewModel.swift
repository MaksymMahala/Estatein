//
//  CryptoViewModel.swift
//  Minus1
//
//  Created by Max on 01.10.2024.
//

import Foundation
import Combine

class CryptoViewModel: ObservableObject {
    @Published var cryptocurrencies: [CryptoCurrency] = []

    private var cancellables = Set<AnyCancellable>()

    func fetchCryptocurrencies() {
        guard let url = URL(string: Constants.URLS.cryptoCurrenciesInfo) else { return }

        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [CryptoCurrency].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .assign(to: \.cryptocurrencies, on: self)
            .store(in: &cancellables)
    }
}
