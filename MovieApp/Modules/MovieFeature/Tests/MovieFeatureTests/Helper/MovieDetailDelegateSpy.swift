//
//  MovieDetailDelegateSpy.swift
//  
//
//  Created by Tifo Audi Alif Putra on 17/03/22.
//

import Foundation
import MovieFeature

class MovieDetailDelegateSpy: MovieDetailDelegate {
    
    var getMovieDetailViewModelCalled = false
    var movieViewModel: MovieDetailViewModel?
    
    func getMovieDetailViewModel() -> MovieDetailViewModel {
        getMovieDetailViewModelCalled = true
        guard let movieViewModel = movieViewModel else {
            return MovieDetailViewModel(
                title: "Iron Man",
                overview: "Overview movie",
                posterURL: "Overview poster URL",
                voteAveragePercent: "50%"
            )
        }

        return movieViewModel
    }
}
