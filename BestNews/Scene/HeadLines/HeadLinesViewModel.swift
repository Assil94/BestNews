//
//  HeadLinesViewModel.swift
//  BestNews
//
//  Created by Assil Heddar on 22/09/2022.
//

import Foundation

class HeadLinesViewModel {
    private let headLinesClient: HeadLinesServicing
    // Dependency Injection 
    init(headLinesClient: HeadLinesServicing) {
        self.headLinesClient = headLinesClient
    }
    
    var dataLoading: LiveData<Bool> = LiveData(false)
    var arrayOfArticles: LiveData<[Articles]> = LiveData([])
    var errorHandler: (_ title: String, _ message: String) -> Void = { _, _ in }
    
    func getHeadlines(country: String) {
        if dataLoading.getValue() != true {
            dataLoading.setValue(value: true)
            DispatchQueue(label: "headlines data", qos: .background).async { [self] in
                headLinesClient.getHeadlines(country: country) { result in
                    switch result {
                    case .success(let data):
                        self.arrayOfArticles.postValue(value: data.articles)
                        self.dataLoading.postValue(value: false)
                    case .failure:
                        self.dataLoading.postValue(value: false)
                        self.errorHandler("Erreur", "Articles indisponible pour le moment")
                    }
                }
            }
        }
    }
}
