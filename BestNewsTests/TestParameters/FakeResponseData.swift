//
//  FakeResponseData.swift
//  BestNewsTests
//
//  Created by Assil Heddar on 28/09/2022.
//

import Foundation

class FakeResponseData {
    static let responseOk = HTTPURLResponse(
        url: URL(string: "https://newsapi.org/v2/top-headlines?country=fr&apiKey=b2dfa9b00ffb4504bd72afddabdb0731")!,
        statusCode: 200,
        httpVersion: nil,
        headerFields: nil)!
    
    static let responseKo = HTTPURLResponse(
        url: URL(string: "https://newsapi.org/v2/top-headlines?country=fr&apiKey=b2dfa9b00ffb4504bd72afddabdb0731")!,
        statusCode: 500,
        httpVersion: nil,
        headerFields: nil)!
    
    //HeadLines
    class HeadLinesError: Error {}
    static let error = HeadLinesError()
    static var headLinesCorrectData: Data {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "HeadLines", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
    
    static let incorrectData = "erreur".data(using: .utf8)
}
