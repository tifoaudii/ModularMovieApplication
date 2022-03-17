//
//  MovieViewModel+Movie.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 15/03/22.
//

import MovieFeature
import MovieDomain

extension MovieViewModel {
    init(movie: Movie, selection: @escaping () -> Void) {
        self.init(
            title: movie.title,
            posterURL: String.init(format: "%@/%@", arguments: [Movie.baseURL, movie.posterPath ?? ""]),
            selection: selection
        )
    }
}
