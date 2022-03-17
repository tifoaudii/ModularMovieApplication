//
//  File.swift
//  
//
//  Created by Tifo Audi Alif Putra on 17/03/22.
//

import XCTest
@testable import MovieFeature

class MovieDetailViewControllerTest: XCTestCase {
    
    func test_whenViewDidLoad_shouldLoadAllOutlets() {
        let delegate = MovieDetailDelegateSpy()
        let sut = MovieDetailViewController(delegate: delegate)
        
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.posterImage)
        XCTAssertNotNil(sut.gradientView)
        XCTAssertNotNil(sut.movieTitle)
        XCTAssertNotNil(sut.movieOverview)
        XCTAssertNotNil(sut.voteAverage)
    }
    
    func test_whenViewDidLoad_shouldRenderMovieDetailViewModel() {
        let delegate = MovieDetailDelegateSpy()
        delegate.movieViewModel = MovieDetailViewModel(
            title: "Batman",
            overview: "Hero Gotham",
            posterURL: "www.batman.com",
            voteAveragePercent: "100%"
        )
        
        let sut = MovieDetailViewController(delegate: delegate)
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.title, delegate.movieViewModel!.title)
        XCTAssertEqual(sut.movieTitle.text, delegate.movieViewModel!.title)
        XCTAssertEqual(sut.movieOverview.text, delegate.movieViewModel!.overview)
        XCTAssertEqual(sut.voteAverage.text, delegate.movieViewModel!.voteAveragePercent)
    }
}
