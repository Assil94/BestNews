//
//  String.swift
//  BestNews
//
//  Created by Assil Heddar on 27/09/2022.
//

import Foundation

extension String {
    var htmlToAttributedString: NSMutableAttributedString {
        return convertHtml()
    }

    var htmlToAttributedStringWithoutTrim: NSMutableAttributedString {
        return convertHtml(false)
    }

    var htmlToString: String {
        return convertHtml().string
    }

    private func convertHtml(_ trim: Bool = true) -> NSMutableAttributedString {
        guard let data = data(using: .utf8) else { return NSMutableAttributedString() }
        do {
            let value = try NSMutableAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            if trim {
                return value.attributedStringByTrimmingCharacterSet(charSet: .whitespacesAndNewlines)
            } else {
                return value
            }

        } catch {
            return NSMutableAttributedString()
        }
    }
}
