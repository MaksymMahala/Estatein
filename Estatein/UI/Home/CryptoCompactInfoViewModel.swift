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
    @Published var topCryptocurrencies: [CryptoCurrencyCompactInfo] = []
    @Published var recentCryptocurrencies: [CryptoCurrencyCompactInfo] = []
    @Published var errorMessage: String?
    
    private let cryptoCurrencyService: CryptoCurrencyService
    private var cancellables = Set<AnyCancellable>()
    
    init(cryptoCurrencyService: CryptoCurrencyService) {
        self.cryptoCurrencyService = cryptoCurrencyService
    }
    
    func fetchCryptocurrencies() {
        fetchData(urlType: .cryptocurrencies)
    }

    func fetchTopCryptocurrencies() {
        fetchData(urlType: .topCryptocurrencies)
    }

    func fetchRecentCryptocurrencies() {
        fetchData(urlType: .recentCryptocurrencies)
        print("recentCryptocurrencies: \(recentCryptocurrencies)")
    }
    
    private func fetchData(urlType: URLType) {
        let fetchCompletion: (Result<[CryptoCurrencyCompactInfo], Error>) -> Void = { result in
            switch result {
            case .success(let data):
                self.updateDataFor(urlType: urlType, data: data)
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
        
        switch urlType {
        case .topCryptocurrencies:
            cryptoCurrencyService.fetchTopCryptocurrencies(completion: fetchCompletion)
        case .cryptocurrencies:
            cryptoCurrencyService.fetchCryptocurrencies(completion: fetchCompletion)
        case .recentCryptocurrencies:
            cryptoCurrencyService.fetchRecentCryptocurrencies(completion: fetchCompletion)
        }
    }
    
    private func updateDataFor(urlType: URLType, data: [CryptoCurrencyCompactInfo]) {
        switch urlType {
        case .topCryptocurrencies:
            self.topCryptocurrencies = data
        case .cryptocurrencies:
            self.cryptocurrencies = data
        case .recentCryptocurrencies:
            self.recentCryptocurrencies = data
        }
    }
}

enum URLType {
    case topCryptocurrencies
    case cryptocurrencies
    case recentCryptocurrencies
}
