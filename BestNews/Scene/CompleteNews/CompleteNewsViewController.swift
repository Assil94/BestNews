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
    
    @IBOutlet weak var newsDescription: UILabel!
    @IBOutlet weak var publishedAtLabel: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var sourceName: UILabel!
    @IBOutlet weak var linkTextView: UITextView!
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
        linkTextView.text = "Lien vers article complet : \(article?.url ?? "")"
        newsImageView.loadFrom(URLAddress: article?.urlToImage ?? "", placeholder: UIImageView.imagePlaceholder)
        newsDescription.text = article?.description ?? "Pas de description pour cet article"
    }
}
