//
//  AppFlow.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 12/03/22.
//

import Foundation

public final class AppFlow {
    
    private let router: Router
    private let movieListDelegate: MovieListDelegate
    
    public init(router: Router, movieListDelegate: MovieListDelegate) {
        self.router = router
        self.movieListDelegate = movieListDelegate
    }
    
    public func start() {
        router.navigateToListMovies(delegate: movieListDelegate) { [weak self] (movie) in
            self?.navigateToMovieDetail(movie: movie)
        }
    }
    
    private func navigateToMovieDetail(movie: String) {
        router.navigateToMovieDetail(movie: movie)
    }
}
