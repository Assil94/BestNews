//
//  CurrentTopHeadlinesClient.swift
//  BestNews
//
//  Created by Assil Heddar on 22/09/2022.
//

import Foundation

protocol HeadLinesServicing {
    func getHeadlines(country: String, callback: @escaping (Result <HeadLinesData, Error>) -> Void)
}

class CurrentTopHeadlinesClient: HeadLinesServicing {
    //DI
    private var task: URLSessionDataTask?
    private var headLinesSession: URLSession
    private let apiKey = valueForAPIKey(named: "newsAPI")
    
    init(headLinesSession: URLSession = URLSession(configuration: .default)) {
        self.headLinesSession = headLinesSession
    }
    
    func getHeadlines(country: String, callback: @escaping (Result <HeadLinesData, Error>) -> Void) {
        let path = "https://newsapi.org/v2/top-headlines?"
        let param = "country=\(country)&apiKey="
        guard let url = URL(string: "\(path)\(param)\(apiKey)") else { return }
        
        
        headLinesSession.request(url: url, expecting: HeadLinesData.self, task: task) { result in
            switch result {
            case .success(let data):
                callback(.success(data))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}

