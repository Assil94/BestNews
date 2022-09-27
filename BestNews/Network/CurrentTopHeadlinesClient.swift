//
//  CurrentTopHeadlinesClient.swift
//  BestNews
//
//  Created by Assil Heddar on 22/09/2022.
//

import Foundation

class CurrentTopHeadlinesClient {
    private var task: URLSessionDataTask?
    private var weatherSession: URLSession
    private let apiKey = valueForAPIKey(named: "newsAPI")
    
    init(weatherSession: URLSession = URLSession(configuration: .default)) {
        self.weatherSession = weatherSession
    }
    
    func getHeadlines(country: String, callback: @escaping (Result <HeadLinesData, Error>) -> Void) {
        let path = "https://newsapi.org/v2/top-headlines?"
        let param = "country=\(country)&apiKey="
        guard let url = URL(string: "\(path)\(param)\(apiKey)") else { return }
        print(url)
        URLSession.shared.request(url: url, expecting: HeadLinesData.self) { result in
            switch result {
            case .success(let data):
                callback(.success(data))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}

