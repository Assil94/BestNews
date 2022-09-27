//
//  HeadLinesViewModel.swift
//  BestNews
//
//  Created by Assil Heddar on 22/09/2022.
//

import Foundation

class HeadLinesViewModel {
    private let headLinesClient = CurrentTopHeadlinesClient()
    
    var dataLoading: LiveData<Bool> = LiveData(false)
    var array: LiveData<[Articles]> = LiveData([])
    
    func getHeadlines(country: String) {
        if dataLoading.getValue() != true {
            dataLoading.setValue(value: true)
            headLinesClient.getHeadlines(country: country) { result in
                switch result {
                case .success(let data):
                    self.array.postValue(value: data.articles)
                    self.dataLoading.postValue(value: false)
                case .failure(let error):
                    print(error)
                    // TODO: Implement
                }
            }
        }
    }
}
