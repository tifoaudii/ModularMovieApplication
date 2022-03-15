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
    
    public init(title: String, posterURL: String) {
        self.title = title
        self.posterURL = posterURL
    }
}
