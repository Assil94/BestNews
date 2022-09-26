//
//  UIImageView.swift
//  BestNews
//
//  Created by Assil Heddar on 26/09/2022.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func loadFrom(URLAddress: String, placeholder: UIImage? = nil) {
        guard let url = URL(string: URLAddress) else {
            return }
            if accessibilityIdentifier != url.path {
                accessibilityIdentifier = url.path
                KF.url(url).placeholder(placeholder).set(to: self)
            }
    }
}
