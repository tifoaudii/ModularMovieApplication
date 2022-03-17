//
//  MovieDetailAdapterDelegate.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 16/03/22.
//

import Foundation
import MovieFeature
import MovieDomain

struct MovieDetailAdapterDelegate: MovieDetailDelegate {
    
    private let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    func getMovieDetailViewModel() -> MovieDetailViewModel {
        return MovieDetailViewModel(movie: movie)
    }
}
