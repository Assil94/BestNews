//
//  Articles.swift
//  BestNews
//
//  Created by Assil Heddar on 22/09/2022.
//

import Foundation
 
struct Articles: Codable, Equatable {
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    static func == (lhs: Articles, rhs: Articles) -> Bool {
            lhs.source == rhs.source
            && lhs.author == rhs.author
            && lhs.title == rhs.title
            && lhs.description == rhs.description
            && lhs.url == rhs.url
            && lhs.urlToImage == rhs.urlToImage
            && lhs.publishedAt == rhs.publishedAt
            && lhs.content == rhs.content
    }
    
    lazy var showableDate: String = {
        return Date().convertToUTC(dateToConvert: publishedAt ?? "")
    }()
}
