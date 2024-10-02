//
//  CryptoViewModel.swift
//  Minus1
//
//  Created by Max on 01.10.2024.
//

import Foundation
import Combine

class CryptoCompactInfoViewModel: ObservableObject {
    @Published var cryptocurrencies: [CryptoCurrencyCompactInfo] = []
    @Published var recentCryptocurrencies: [CryptoCurrencyCompactInfo] = []
    @Published var topCryptocurrencies: [CryptoCurrencyCompactInfo] = []

    private var cancellables = Set<AnyCancellable>()
    
    func fetchCryptocurrencies() {
        guard let url = URL(string: Constants.URLS.cryptoCurrenciesInfo) else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [CryptoCurrencyCompactInfo].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .assign(to: \.cryptocurrencies, on: self)
            .store(in: &cancellables)
    }
    
    func fetchTopCryptocurrencies() {
        guard let url = URL(string: "http://localhost:5500/api/top-cryptocurrencies") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [CryptoCurrencyCompactInfo].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .assign(to: \.topCryptocurrencies, on: self)
            .store(in: &cancellables)
    }
    
    func fetchRecentCryptocurrencies() {
        guard let url = URL(string: "http://localhost:5500/api/recent-cryptocurrencies") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [CryptoCurrencyCompactInfo].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .assign(to: \.recentCryptocurrencies, on: self)
            .store(in: &cancellables)
    }
}
