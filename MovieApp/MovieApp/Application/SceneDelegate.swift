//
//  SceneDelegate.swift
//  MovieApp
//
//  Created by Tifo Audi Alif Putra on 16/03/22.
//

import UIKit
import MovieFeature

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let navigationController = UINavigationController()
        window = UIWindow()
        
        let invoker = SceneDelegateInvoker(commands: [
            WindowConfigurableCommand(navigationController: navigationController, window: window, scene: scene),
            FlowCommand(factory: ViewControllerFactory(), router: AppRouter(navigationController: navigationController))
        ])
        
        invoker.executeCommands()
    }
}

