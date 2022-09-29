//
//  HeadLinesViewModelTest.swift
//  BestNewsTests
//
//  Created by Assil Heddar on 29/09/2022.
//

import XCTest
@testable import BestNews

class HeadLinesViewModelTest: XCTestCase {
    var headLinesViewModel: HeadLinesViewModel!
    
    override func setUp() {
        headLinesViewModel = HeadLinesViewModel(headLinesClient: DependencyProvider.service)
    }
    
    override func tearDown() {
        headLinesViewModel = nil
        super.tearDown()
    }
    
    func testGetHeadlinesFromViewModel() {
        let arrayOfArticle: LiveData<[Articles]> = LiveData([])
        //Given
        let currentHeadLines = CurrentTopHeadlinesClient(headLinesSession: URLSessionFake(data: FakeResponseData.headLinesCorrectData, response: FakeResponseData.responseOk, error: nil))
        //when
        currentHeadLines.getHeadlines(country: "fr", callback: { result in
            if case .success(let data) = result {
                arrayOfArticle.postValue(value: data.articles)
            }
        })
        // Then
        XCTAssertNotNil(arrayOfArticle.getValue)
        XCTAssertEqual(arrayOfArticle.getValue()?.first?.author,
                       "Florence Morel, Louis Boy, Marie-Adélaïde Scigacz")
    }
    
    func testErrorHandlerHeadLines() {
        //Given
        let currentHeadLines = CurrentTopHeadlinesClient(headLinesSession: URLSessionFake(data: FakeResponseData.incorrectData, response: FakeResponseData.responseOk, error: nil))
        let viewModel = HeadLinesViewModel(headLinesClient: currentHeadLines)
        //When
        viewModel.errorHandler = { title, message in
            //Then
            XCTAssertEqual(title, "Erreur")
            XCTAssertEqual(message, "Articles indisponible pour le moment")
        }
        viewModel.getHeadlines(country: "fr")
    }
}
