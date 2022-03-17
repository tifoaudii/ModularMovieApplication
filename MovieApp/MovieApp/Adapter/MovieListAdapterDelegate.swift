//
//  MovieAdapterService.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 13/03/22.
//

import Service
import MovieFeature
import Foundation
import MovieDomain

final class MovieListAdapterDelegate: MovieListDelegate {
    
    private let service: NetworkService
    private let selection: (Movie) -> Void
    
    init(service: NetworkService, selection: @escaping (Movie) -> Void) {
        self.service = service
        self.selection = selection
    }
    
    func fetchMovies(completion: @escaping ([MovieViewModel], ErrorViewModel?) -> Void) {
        let request = MovieListRequest()
        service.request(request) { result in
            switch result {
            case .success(let movies):
                DispatchQueue.main.async {
                    completion(self.createMovieViewModel(movies: movies), nil)
                }
            case .failure(let error):
                completion([], ErrorViewModel(error: error))
            }
        }
    }
    
    private func createMovieViewModel(movies: [Movie]) -> [MovieViewModel] {
        return movies.map { movie in
            MovieViewModel(movie: movie) { [weak self] in
                self?.selection(movie)
            }
        }
    }
}
