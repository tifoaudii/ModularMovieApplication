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
    
    func test_whenMovieSelected_shouldNavigateToMovieDetailScreen() {
        let router = RouterSpy()
        let sut = AppFlow(router: router)
        
        sut.start()
        router.selectMovieCallback?("Iron Man")
        
        XCTAssertTrue(router.navigateToMovieDetailCalled)
    }
    
    // MARK: Helper
    
    class RouterSpy: Router {
        
        var selectMovieCallback: ((String) -> Void)?
        var navigateToListMoviesCalled = false
        var navigateToMovieDetailCalled = false
        var selectedMovie: String?
        
        func navigateToListMovies(onMovieSelected: @escaping (String) -> Void) {
            navigateToListMoviesCalled = true
            selectMovieCallback = onMovieSelected
        }
        
        func navigateToMovieDetail(movie: String) {
            selectedMovie = movie
            navigateToMovieDetailCalled = true
        }
    }
}
