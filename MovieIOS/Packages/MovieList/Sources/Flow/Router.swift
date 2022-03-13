//
//  Router.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 12/03/22.
//

import Foundation
import UIKit

public protocol Router {
    func navigateToListMovies(delegate: MovieListDelegate, onMovieSelected: @escaping (String) -> Void)
    func navigateToMovieDetail(movie: String)
}

public final class AppRouter: Router {
    
    private let navigationController: UINavigationController
    private let factory: UIFactory
    
    public init(navigationController: UINavigationController, factory: UIFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    public func navigateToListMovies(delegate: MovieListDelegate ,onMovieSelected: @escaping (String) -> Void) {
        let listMovieViewController = factory.createListMovieViewController(delegate: delegate, onMovieSelected: onMovieSelected)
        navigationController.pushViewController(listMovieViewController, animated: true)
    }
    
    public func navigateToMovieDetail(movie: String) {
        let movieDetailViewController = factory.createMovieDetailViewController(movie: movie)
        navigationController.pushViewController(movieDetailViewController, animated: true)
    }
}
