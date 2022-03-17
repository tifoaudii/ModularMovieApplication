//
//  FlowCommandTest.swift
//  MovieAppTests
//
//  Created by Tifo Audi Alif Putra on 17/03/22.
//

import XCTest
import MovieFeature
import MovieDomain
@testable import MovieApp

class FlowCommandTest: XCTestCase {

    
    func test_whenFlowCommandExecuted_shouldAskRouterNavigateToMovieList() {
        
        let factory = ViewControllerFactorySpy()
        let router = RouterSpy()
        let sut = FlowCommand(factory: factory, router: router)
        
        sut.executeCommand()
        XCTAssertTrue(router.navigateCalled)
    }
    
    func test_whenFlowCommandExecuted_shouldAskFactoryCreateMovieListViewController() {
        let factory = ViewControllerFactorySpy()
        let router = RouterSpy()
        let sut = FlowCommand(factory: factory, router: router)
        let movieViewController = UIViewController()
        
        factory.movieListViewController = movieViewController
        
        sut.executeCommand()
        XCTAssertEqual(router.viewController, movieViewController)
    }
    
    class ViewControllerFactorySpy: UIFactory {
        
        var movieListViewController: UIViewController?
        var movieDetailViewController: UIViewController?
        
        func createListMovieViewController(delegate: MovieListDelegate) -> UIViewController {
            movieListViewController ?? UIViewController()
        }
        
        func createMovieDetailViewController(delegate: MovieDetailDelegate) -> UIViewController {
            movieDetailViewController ?? UIViewController()
        }
    }
    
    class RouterSpy: Router {
        
        var navigateCalled = false
        var viewController: UIViewController?
        
        func navigate(to viewController: UIViewController) {
            navigateCalled = true
            self.viewController = viewController
        }
    }

}
