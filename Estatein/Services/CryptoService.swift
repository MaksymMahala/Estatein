//
//  CryptoService.swift
//  Minus1
//
//  Created by Max on 13.01.2025.
//

import Foundation
import Alamofire

class NetworkService: NetworkServiceProtocol {
    func fetch<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(url)
            .validate()
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                    print("data: \(data)")
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

class CryptoCurrencyService {
    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchTopCryptocurrencies(completion: @escaping (Result<[CryptoCurrencyCompactInfo], Error>) -> Void) {
        guard let url = URL(string: "https://crypto-app-back-489b3c42aa7f.herokuapp.com/api/top-cryptocurrencies") else { return }
        networkService.fetch(url: url, completion: completion)
    }
    
    func fetchCryptocurrencies(completion: @escaping (Result<[CryptoCurrencyCompactInfo], Error>) -> Void) {
        guard let url = URL(string: Constants.REST.cryptoMarkets) else { return }
        networkService.fetch(url: url, completion: completion)
    }

    func fetchRecentCryptocurrencies(completion: @escaping (Result<[CryptoCurrencyCompactInfo], Error>) -> Void) {
        guard let url = URL(string: "https://crypto-app-back-489b3c42aa7f.herokuapp.com/api/recent-cryptocurrencies") else { return }
        networkService.fetch(url: url, completion: completion)
    }
}
