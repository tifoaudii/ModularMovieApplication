//
//  MovieDetailViewModel.swift
//  
//
//  Created by Tifo Audi Alif Putra on 16/03/22.
//

import Foundation

public struct MovieDetailViewModel {
    
    let title: String
    let overview: String
    let posterURL: String
    let voteAveragePercent: String
    
    public init(title: String, overview: String, posterURL: String, voteAveragePercent: String) {
        self.title = title
        self.overview = overview
        self.posterURL = posterURL
        self.voteAveragePercent = voteAveragePercent
    }
}
