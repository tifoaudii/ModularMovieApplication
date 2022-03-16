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
    
    func test_router_shouldPushViewController() {
        let navigationController = UINavigationController()
        let sut = AppRouter(navigationController: navigationController)
        
        let viewController = UIViewController()
        sut.navigate(to: viewController)
        
        XCTAssertEqual(navigationController.viewControllers.count, 1)
        XCTAssertEqual(navigationController.viewControllers.first, viewController)
    }
}
