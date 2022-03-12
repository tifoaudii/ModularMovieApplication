//
//  AppFlow.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 12/03/22.
//

import Foundation

final class AppFlow {
    
    private let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        router.navigateToListMovies { [weak self] (movie) in
            self?.navigateToMovieDetail(movie: movie)
        }
    }
    
    private func navigateToMovieDetail(movie: String) {
        router.navigateToMovieDetail(movie: movie)
    }
}
