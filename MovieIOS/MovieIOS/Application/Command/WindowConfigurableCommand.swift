//
//  WindowConfigurableCommand.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 13/03/22.
//

import UIKit

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
