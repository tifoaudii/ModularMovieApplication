//
//  FlowCommand.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 13/03/22.
//

import UIKit
import MovieList

final class FlowCommand: SceneDelegateCommand {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func executeCommand() {
        let viewControllerFactory = ViewControllerFactory()
        let router = AppRouter(navigationController: navigationController, factory: viewControllerFactory)
        let flow = AppFlow(router: router)
        flow.start()
    }
}
