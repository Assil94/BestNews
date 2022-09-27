//
//  UITextView.swift
//  BestNews
//
//  Created by Assil Heddar on 27/09/2022.
//

import Foundation
import UIKit

extension UITextView {
    func setHtmlText(_ text: NSMutableAttributedString?, size: CGFloat = 13) {
        text?.addAttribute(.font, value: font,
                           range: NSMakeRange(0, text?.length ?? 0))

        attributedText = text
    }
}
