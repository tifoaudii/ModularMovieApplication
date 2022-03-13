//
//  MovieListViewControllerTest.swift
//  MovieIOSTests
//
//  Created by Tifo Audi Alif Putra on 12/03/22.
//

import XCTest
@testable import MovieList

class MovieListViewControllerTest: XCTestCase {
    
    func test_listMoviesViewController_shouldLoadCollectionView() {
        let sut = MovieListViewController(nibName: nil, bundle: .module)
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.collectionView)
    }
}
