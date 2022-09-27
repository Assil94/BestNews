//
//  CompleteNewsViewController.swift
//  BestNews
//
//  Created by Assil Heddar on 26/09/2022.
//

import Foundation
import UIKit

class CompleteNewsViewController: UIViewController {
    var article: Articles? = nil
    
    
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var publishedAtLabel: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var sourceName: UILabel!
    @IBOutlet weak var contentOfNews: UITextView!
    @IBOutlet weak var newsImageView: UIImageView!
    
    override func viewDidLoad() {
        updateUI()
    }
}

extension CompleteNewsViewController {
    private func updateUI() {
        publishedAtLabel.text = "Publié le : \(article?.showableDate ?? "")"
        sourceName.text = article?.source?.name
        author.text = article?.author
        contentOfNews.attributedText = article?.url?.htmlToAttributedString
        newsImageView.loadFrom(URLAddress: article?.urlToImage ?? "")
        info.text = article?.description
    }
}
