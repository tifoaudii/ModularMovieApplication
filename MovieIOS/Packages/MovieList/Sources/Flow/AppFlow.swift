//
//  AppFlow.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 12/03/22.
//

import Foundation

public final class AppFlow {
    
    private let router: Router
    
    public init(router: Router) {
        self.router = router
    }
    
    public func start() {
        router.navigateToListMovies { [weak self] (movie) in
            self?.navigateToMovieDetail(movie: movie)
        }
    }
    
    private func navigateToMovieDetail(movie: String) {
        router.navigateToMovieDetail(movie: movie)
    }
}
