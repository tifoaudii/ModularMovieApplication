//
//  UIFactory.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 12/03/22.
//

import UIKit

public protocol UIFactory {
    func createListMovieViewController(delegate: MovieListDelegate, onMovieSelected: @escaping (String) -> Void) -> UIViewController
    func createMovieDetailViewController(movie: String) -> UIViewController
}

public final class ViewControllerFactory: UIFactory {
    
    public init() {}
    
    public func createListMovieViewController(delegate: MovieListDelegate, onMovieSelected: @escaping (String) -> Void) -> UIViewController {
        let movieViewController = MovieListViewController(delegate: delegate)
        return movieViewController
    }
    
    public func createMovieDetailViewController(movie: String) -> UIViewController {
        UIViewController()
    }
}
