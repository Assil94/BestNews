//
//  HeadLinesData.swift
//  BestNews
//
//  Created by Assil Heddar on 22/09/2022.
//

import Foundation

struct HeadLinesData: Codable {
    let status: String
    let totalResults: Int
    let articles: [Articles]?
}
