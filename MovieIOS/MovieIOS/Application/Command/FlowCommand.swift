//
//  FlowCommand.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 13/03/22.
//

import UIKit
import MovieList
import Service

final class FlowCommand: SceneDelegateCommand {
    
    private let factory: UIFactory
    private let router: Router
    
    init(factory: UIFactory, router: Router) {
        self.factory = factory
        self.router = router
    }
    
    func executeCommand() {
        let movieAdapterDelegate = MovieListAdapterDelegate(service: URLSessionNetworkService()) { [weak self] movie in
            guard let self = self else { return }
            let movieDetailDelegate = MovieDetailAdapterDelegate(movie: movie)
            let movieDetailViewController = self.factory.createMovieDetailViewController(delegate: movieDetailDelegate)
            self.router.navigate(to: movieDetailViewController)
        }
        
        let movieListViewController = factory.createListMovieViewController(delegate: movieAdapterDelegate)
        router.navigate(to: movieListViewController)
    }
}
