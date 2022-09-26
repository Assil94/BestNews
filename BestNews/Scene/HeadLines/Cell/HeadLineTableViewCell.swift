//
//  HeadLineTableViewCell.swift
//  BestNews
//
//  Created by Assil Heddar on 25/09/2022.
//

import UIKit

class HeadLineTableViewCell: BaseUITableViewCell<Articles> {
    @IBOutlet weak var headlineImg: UIImageView!
    @IBOutlet weak var title: UILabel!
    static let identifier = "HeadLineTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "HeadLineTableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func bind(newValue: Articles?) {
        title.text = newValue?.title
        headlineImg.loadFrom(URLAddress: newValue?.urlToImage ?? "")
    }
}
