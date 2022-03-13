//
//  UIFactory.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 12/03/22.
//

import UIKit

public protocol UIFactory {
    func createListMovieViewController(onMovieSelected: @escaping (String) -> Void) -> UIViewController
    func createMovieDetailViewController(movie: String) -> UIViewController
}

public final class ViewControllerFactory: UIFactory {
    
    public init() {}
    
    public func createListMovieViewController(onMovieSelected: @escaping (String) -> Void) -> UIViewController {
        MovieListViewController(nibName: nil, bundle: .module)
    }
    
    public func createMovieDetailViewController(movie: String) -> UIViewController {
        UIViewController()
    }
}
