//
//  ViewControllerFactoryTest.swift
//  MovieIOSTests
//
//  Created by Tifo Audi Alif Putra on 12/03/22.
//

import XCTest
@testable import MovieList

class ViewControllerFactoryTest: XCTestCase {
    
    func test_viewControllerFactory_shouldCreateListMoviesViewController() {
        let sut = ViewControllerFactory()
        let delegate = MovieListDelegateSpy()
        let viewController = sut.createListMovieViewController(delegate: delegate)
        XCTAssertNotNil(viewController)
    }
}
