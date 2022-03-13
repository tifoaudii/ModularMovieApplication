//
//  RouterTest.swift
//  MovieIOSTests
//
//  Created by Tifo Audi Alif Putra on 12/03/22.
//

import UIKit
import XCTest
@testable import MovieList

class RouterTest: XCTestCase {
    
    func test_whenNavigateToListMovies_shouldPushToNavigationController() {
        let navigationController = UINavigationController()
        let factory = ViewControllerFactoryStub()
        let viewController = UIViewController()
        factory.listMovieViewController = viewController
        let sut = AppRouter(navigationController: navigationController, factory: factory)
        
        sut.navigateToListMovies(onMovieSelected: { _ in })
        
        XCTAssertEqual(navigationController.viewControllers.count, 1)
        XCTAssertEqual(navigationController.viewControllers.first!, viewController)
    }
    
    func test_whenNavigateToListMovies_shouldGetCorrectMovieCallback() {
        let navigationController = UINavigationController()
        let factory = ViewControllerFactoryStub()
        let viewController = UIViewController()
        factory.listMovieViewController = viewController
        let sut = AppRouter(navigationController: navigationController, factory: factory)
        
        var movieCallbackCalled = false
        var movieSelected = ""
        
        sut.navigateToListMovies(onMovieSelected: { movie in
            movieSelected = movie
            movieCallbackCalled = true
        })
        
        factory.selectedMovie?("Iron Man")
        
        XCTAssertTrue(movieCallbackCalled)
        XCTAssertEqual(movieSelected, "Iron Man")
    }
    
    func test_whenNavigateToMovieDetail_shouldPushViewControllerCorrectly() {
        let navigationController = UINavigationController()
        let factory = ViewControllerFactoryStub()
        let viewController = UIViewController()
        
        factory.movieDetailViewController = viewController
        let sut = AppRouter(navigationController: navigationController, factory: factory)
        
        sut.navigateToMovieDetail(movie: "Batman")
        XCTAssertEqual(navigationController.viewControllers.first!, viewController)
    }
    
    // MARK: Helper
    
    class ViewControllerFactoryStub: UIFactory {
        
        var listMovieViewController: UIViewController?
        var movieDetailViewController: UIViewController?
        var selectedMovie: ((String) -> Void)?
        
        func createListMovieViewController(onMovieSelected: @escaping (String) -> Void) -> UIViewController {
            selectedMovie = onMovieSelected
            return listMovieViewController!
        }
        
        func createMovieDetailViewController(movie: String) -> UIViewController {
            movieDetailViewController!
        }
    }
}
