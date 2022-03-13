//
//  SceneDelegateCommand.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 13/03/22.
//

import Foundation

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
