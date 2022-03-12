//
//  Router.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 12/03/22.
//

import Foundation
import UIKit

protocol Router {
    func navigateToListMovies()
    func navigateToMovieDetail(movie: String)
}

final class AppRouter: Router {
    
    private let navigationController: UINavigationController
    private let factory: UIFactory
    
    init(navigationController: UINavigationController, factory: UIFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func navigateToListMovies() {
        let listMovieViewController = factory.createListMovieViewController()
        navigationController.pushViewController(listMovieViewController, animated: true)
    }
    
    func navigateToMovieDetail(movie: String) {
        let movieDetailViewController = factory.createMovieDetailViewController(movie: movie)
        navigationController.pushViewController(movieDetailViewController, animated: true)
    }
}
