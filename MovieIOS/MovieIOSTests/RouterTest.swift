//
//  RouterTest.swift
//  MovieIOSTests
//
//  Created by Tifo Audi Alif Putra on 12/03/22.
//

import UIKit
import XCTest
@testable import MovieIOS

class RouterTest: XCTestCase {
    
    func test_whenNavigateToListMovies_shouldPushToNavigationController() {
        let navigationController = UINavigationController()
        let factory = ViewControllerFactoryStub()
        let viewController = UIViewController()
        factory.listMovieViewController = viewController
        let sut = AppRouter(navigationController: navigationController, factory: factory)
        
        sut.navigateToListMovies()
        
        XCTAssertEqual(navigationController.viewControllers.count, 1)
        XCTAssertEqual(navigationController.viewControllers.first!, viewController)
    }
    
    // TODO: Add testcase when navigate to movie detail
    
    // MARK: Helper
    
    class ViewControllerFactoryStub: UIFactory {
        
        var listMovieViewController: UIViewController?
        
        func createListMovieViewController() -> UIViewController {
            listMovieViewController!
        }
        
        func createMovieDetailViewController(movie: String) -> UIViewController {
            UIViewController()
        }
    }
}
