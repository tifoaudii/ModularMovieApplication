//
//  SceneDelegate.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 12/03/22.
//

import UIKit

protocol SceneDelegateCommand {
    func executeCommand()
}

final class SceneDelegateInvoker {
    
    private let commands: [SceneDelegateCommand]
    
    init(commands: [SceneDelegateCommand]) {
        self.commands = commands
    }
    
    func executeCommands() {
        commands.forEach { $0.executeCommand() }
    }
}

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

final class WindowConfigurableCommand: SceneDelegateCommand {
    
    private let navigationController: UINavigationController
    private let scene: UIScene
    
    private var window: UIWindow?
    
    init(navigationController: UINavigationController, window: UIWindow?, scene: UIScene) {
        self.navigationController = navigationController
        self.window = window
        self.scene = scene
    }
    
    func executeCommand() {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window?.windowScene = windowScene
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let navigationController = UINavigationController()
        window = UIWindow()
        
        let invoker = SceneDelegateInvoker(
            commands: [
                WindowConfigurableCommand(
                    navigationController: navigationController,
                    window: window,
                    scene: scene
                ),
                
                FlowCommand(
                    navigationController: navigationController
                )
            ]
        )
        
        invoker.executeCommands()
    }
}

