//
//  URLSession.swift
//  BestNews
//
//  Created by Assil Heddar on 20/09/2022.
//

import Foundation

extension URLSession {
    // Generic Call
    func request<T: Codable>(
        url: URL?,
        expecting: T.Type,
        task: URLSessionDataTask?,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let url = url else {
            completion(.failure(NetworkError.badUrl))
            return
        }
        var localTask = task
        localTask = dataTask(with: url) { data, _, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(NetworkError.noData))
                }
                return
            }
            
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            }
            catch {
                completion (.failure(error))
            }
        }
        localTask?.resume()
    }
}
