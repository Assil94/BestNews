//
//  BaseUITableViewCell.swift
//  BestNews
//
//  Created by Assil Heddar on 25/09/2022.
//

import Foundation
import UIKit
// Generic UITableViewCell.
class BaseUITableViewCell<T>: UITableViewCell {
    internal var value: T?

    func bind(newValue: T?) {
        value = newValue
    }
}

