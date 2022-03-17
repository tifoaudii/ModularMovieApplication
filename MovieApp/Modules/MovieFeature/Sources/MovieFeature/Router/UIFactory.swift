//
//  UIFactory.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 12/03/22.
//

import UIKit

public protocol UIFactory {
    func createListMovieViewController(delegate: MovieListDelegate) -> UIViewController
    func createMovieDetailViewController(delegate: MovieDetailDelegate) -> UIViewController
}

public final class ViewControllerFactory: UIFactory {
    
    public init() {}
    
    public func createListMovieViewController(delegate: MovieListDelegate) -> UIViewController {
        let movieViewController = MovieListViewController(delegate: delegate)
        return movieViewController
    }
    
    public func createMovieDetailViewController(delegate: MovieDetailDelegate) -> UIViewController {
        MovieDetailViewController(delegate: delegate)
    }
}
