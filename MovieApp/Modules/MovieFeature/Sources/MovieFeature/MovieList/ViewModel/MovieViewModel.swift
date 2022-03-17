//
//  MovieViewModel.swift
//  
//
//  Created by Tifo Audi Alif Putra on 14/03/22.
//

import Foundation

public struct MovieViewModel {
    let title: String
    let posterURL: String
    let selection: () -> Void
    
    public init(title: String, posterURL: String, selection: @escaping () -> Void) {
        self.title = title
        self.posterURL = posterURL
        self.selection = selection
    }
}
