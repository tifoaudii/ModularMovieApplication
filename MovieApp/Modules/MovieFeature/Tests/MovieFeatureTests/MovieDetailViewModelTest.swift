//
//  MovieDetailViewModelTest.swift
//  
//
//  Created by Tifo Audi Alif Putra on 17/03/22.
//

import Foundation
import XCTest
@testable import MovieFeature

class MovieDetailViewModelTest: XCTestCase {
    
    func test_movieDetailViewModel_shouldInitializedCorrectly() {
        let sut = MovieDetailViewModel(title: "Title", overview: "Overview", posterURL: "Poster URL", voteAveragePercent: "100%")
        
        XCTAssertEqual(sut.title, "Title")
        XCTAssertEqual(sut.overview, "Overview")
        XCTAssertEqual(sut.posterURL, "Poster URL")
        XCTAssertEqual(sut.voteAveragePercent, "100%")
    }
}
