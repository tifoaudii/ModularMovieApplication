//
//  Router.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 12/03/22.
//

import Foundation
import UIKit

public protocol Router {
    func navigate(to viewController: UIViewController)
}

public final class AppRouter: Router {
    
    private let navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func navigate(to viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
}
