//
//  Date.swift
//  BestNews
//
//  Created by Assil Heddar on 27/09/2022.
//

import Foundation

extension Date {
    func convertToUTC(dateToConvert: String) -> String {
        let dtFormatter = ISO8601DateFormatter()
        let date = dtFormatter.date(from: dateToConvert)
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(identifier: "UTC")
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date!)
    }
}
