//
//  MovieListViewModelTest.swift
//  
//
//  Created by Tifo Audi Alif Putra on 17/03/22.
//

import Foundation
import XCTest
@testable import MovieFeature

class MovieListViewModelTest: XCTestCase {
    
    
    func test_movieViewModel_shouldInitializedCorrectly() {
        var selectionCalled = false
        let sut = MovieViewModel(title: "Movie Title", posterURL: "Movie Poster URL") {
            selectionCalled = true
        }
        
        sut.selection()
        
        XCTAssertEqual(sut.title, "Movie Title")
        XCTAssertEqual(sut.posterURL, "Movie Poster URL")
        XCTAssertTrue(selectionCalled)
    }
    
}
