//
//  NetworkServiceProtocol.swift
//  Minus1
//
//  Created by Max on 13.01.2025.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetch<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void)
}
