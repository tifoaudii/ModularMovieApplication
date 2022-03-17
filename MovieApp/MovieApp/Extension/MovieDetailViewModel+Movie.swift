//
//  MovieDetailViewModel+Movie.swift
//  MovieApp
//
//  Created by Tifo Audi Alif Putra on 17/03/22.
//

import MovieFeature
import MovieDomain

extension MovieDetailViewModel {
    init(movie: Movie) {
        print(movie)
        let posterURL: String = String.init(format: "%@/%@", arguments: [Movie.baseURL, movie.posterPath ?? ""])
        let voteAveragePercent: String = "\(Int(movie.voteAverage * 10))%"
        self.init(title: movie.title, overview: movie.overview, posterURL: posterURL, voteAveragePercent: voteAveragePercent)
    }
}
