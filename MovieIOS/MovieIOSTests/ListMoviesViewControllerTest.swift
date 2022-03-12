//
//  ListMoviesViewControllerTest.swift
//  MovieIOSTests
//
//  Created by Tifo Audi Alif Putra on 12/03/22.
//

import XCTest
@testable import MovieIOS

class ListMoviesViewControllerTest: XCTestCase {
    
    func test_listMoviesViewController_shouldLoadCollectionView() {
        let sut = ListMoviesViewController(nibName: "ListMoviesViewController", bundle: nil)
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.collectionView)
    }
}
