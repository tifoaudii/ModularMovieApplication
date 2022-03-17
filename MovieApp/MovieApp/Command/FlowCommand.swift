//
//  FlowCommand.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 13/03/22.
//

import UIKit
import MovieFeature
import Service
import MovieDomain

final class FlowCommand: SceneDelegateCommand {
    
    private let factory: UIFactory
    private let router: Router
    
    init(factory: UIFactory, router: Router) {
        self.factory = factory
        self.router = router
    }
    
    func executeCommand() {
        let movieAdapterDelegate = MovieListAdapterDelegate(service: URLSessionNetworkService()) { movie in
            self.navigateToMovieDetail(movie: movie)
        }
        
        let movieListViewController = factory.createListMovieViewController(delegate: movieAdapterDelegate)
        router.navigate(to: movieListViewController)
    }
    
    private func navigateToMovieDetail(movie: Movie) {
        let movieDetailDelegate = MovieDetailAdapterDelegate(movie: movie)
        let movieDetailViewController = factory.createMovieDetailViewController(delegate: movieDetailDelegate)
        router.navigate(to: movieDetailViewController)
    }
}
