//
//  DependencyProvider.swift
//  BestNews
//
//  Created by Assil Heddar on 28/09/2022.
//

import Foundation
import UIKit

struct DependencyProvider {
    static var service: HeadLinesServicing {
        return CurrentTopHeadlinesClient()
    }
    
    static var viewModel: HeadLinesViewModel {
        HeadLinesViewModel(headLinesClient: self.service)
    }
    
    static var headLinesVC: HeadLinesViewController {
        let vc = UIStoryboard(name: "HeadLines",
                              bundle: nil).instantiateInitialViewController() as! HeadLinesViewController
        vc.headLinesViewModel = viewModel
        return vc
    }
}
