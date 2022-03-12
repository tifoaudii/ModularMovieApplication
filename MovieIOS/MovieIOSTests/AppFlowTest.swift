//
//  AppFlowTest.swift
//  MovieIOSTests
//
//  Created by Tifo Audi Alif Putra on 12/03/22.
//

import Foundation
import XCTest
@testable import MovieIOS

class AppFlowTest: XCTestCase {
    
    func test_whenAppFlowStart_shouldNavigateToListMoviesScreen() {
        let router = RouterSpy()
        let sut = AppFlow(router: router)
        sut.start()
        XCTAssertTrue(router.navigateToListMoviesCalled)
    }
    
    // TODO: Add testcase flow navigate to movie detail
    
    // MARK: Helper
    
    class RouterSpy: Router {
        
        var navigateToListMoviesCalled = false
        
        func navigateToListMovies() {
            navigateToListMoviesCalled = true
        }
        
        func navigateToMovieDetail(movie: String) {}
    }
}
