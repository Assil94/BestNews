//
//  HeadLinesClientTestCase.swift
//  BestNewsTests
//
//  Created by Assil Heddar on 28/09/2022.
//
@testable import BestNews
import XCTest

class HeadLinesClientTestCase: XCTestCase {
    func testGetHeadLinesShouldFailedCallbackIfError() {
        //Given
        let currentHeadLines = CurrentTopHeadlinesClient(headLinesSession: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error))
        let expect = expectation(description: "Wait for error to appear.")
        //When
        currentHeadLines.getHeadlines(country: "fr", callback: { result in
            if case .failure(let error) = result {
                XCTAssertNotNil(error)
                expect.fulfill()
            }
        })
        // Then:
        wait(for: [expect], timeout: 3)
    }
    
    func testGetHeadLinesShouldFailResponseKO() {
        //Given
        let currentHeadLines = CurrentTopHeadlinesClient(headLinesSession: URLSessionFake(data: FakeResponseData.incorrectData, response: FakeResponseData.responseKo, error: nil))
        let expect = expectation(description: "Wait for error to appear.")
        //When
        currentHeadLines.getHeadlines(country: "fr", callback: { result in
            if case .failure(let error) = result {
                XCTAssertNotNil(error)
                expect.fulfill()
            }
        })
        // Then:
        wait(for: [expect], timeout: 3)
    }
    
    
    func testGetHeadLinesShouldFailJsonError() {
        //Given
        let currentHeadLines = CurrentTopHeadlinesClient(headLinesSession: URLSessionFake(data: FakeResponseData.incorrectData, response: FakeResponseData.responseOk, error: nil))
        let expect = expectation(description: "Wait for error to appear.")
        //When
        currentHeadLines.getHeadlines(country: "fr", callback: { result in
            //Then
            if case .failure(let error) = result {
                XCTAssertNotNil(error)
                expect.fulfill()
            }
        })
        wait(for: [expect], timeout: 3)
    }
    
    func testGetHeadLinesCorrectJson() {
        //Given
        let currentHeadLines = CurrentTopHeadlinesClient(headLinesSession: URLSessionFake(data: FakeResponseData.headLinesCorrectData, response: FakeResponseData.responseOk, error: nil))
        let expect = expectation(description: "Wait for error to appear.")
        var totalResult: Int = 0
        var status = ""
        var description = ""
        //When
        currentHeadLines.getHeadlines(country: "fr", callback: { result in
            if case .success(let data) = result {
                totalResult = data.totalResults
                status = data.status
                description = data.articles?.first?.description ?? ""
                XCTAssertEqual(totalResult, 34)
                XCTAssertEqual(status, "ok")
                XCTAssertEqual(description,
                               "La porte-parole de la diplomatie russe demande aussi au président américain Joe Biden de \"répondre à la question\" d'une potentielle implication des Etats-Unis dans ces fuites.")
                expect.fulfill()
            }
        })
        //Then :
        wait(for: [expect], timeout: 3)
    }
}
