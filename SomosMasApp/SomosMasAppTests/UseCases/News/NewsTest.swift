//
//  NewsTest.swift
//  SomosMasAppTests
//
//  Created by Antonella Brini Vago on 21/02/2022.
//

import XCTest
@testable import SomosMasApp

class NewsTest: XCTestCase {
    var sut: HomeViewModel!

    override func setUpWithError() throws {
        sut = HomeViewModel()
    }

    override func tearDownWithError() throws {
    }

    func testHomeViewModel() throws {
        var result: [News]?
        
        sut.getNews(onSuccess: { newsData in
            result = newsData
            XCTAssertNotNil(result)
        }) { error in
            print(error.debugDescription)
        }
    }
}
