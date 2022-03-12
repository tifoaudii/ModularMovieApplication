//
//  UIFactory.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 12/03/22.
//

import UIKit

protocol UIFactory {
    func createListMovieViewController() -> UIViewController
    func createMovieDetailViewController(movie: String) -> UIViewController
}

final class ViewControllerFactory: UIFactory {
    
    func createListMovieViewController() -> UIViewController {
        ListMoviesViewController(nibName: "ListMoviesViewController", bundle: nil)
    }
    
    func createMovieDetailViewController(movie: String) -> UIViewController {
        UIViewController()
    }
}
