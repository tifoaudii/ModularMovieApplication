//
//  FlowCommand.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 13/03/22.
//

import UIKit
import MovieList
import Service

final class FlowCommand: SceneDelegateCommand {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func executeCommand() {
        let viewControllerFactory = ViewControllerFactory()
        let router = AppRouter(navigationController: navigationController, factory: viewControllerFactory)
        let movieAdapterService = MovieAdapterService(service: URLSessionNetworkService(configuration: .default))
        let flow = AppFlow(router: router, movieListDelegate: movieAdapterService)
        flow.start()
    }
}
