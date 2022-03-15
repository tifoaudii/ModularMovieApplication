//
//  MovieAdapterService.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 13/03/22.
//

import Service
import MovieList
import Foundation
import Domain

final class MovieAdapterService: MovieListDelegate {
    
    private let service: NetworkService
    private let imageFetcher: ImageFetcher
    
    private weak var output: MovieListOutput?
    
    init(service: NetworkService, imageFetcher: ImageFetcher = ImageFetcher.shared()) {
        self.service = service
        self.imageFetcher = imageFetcher
    }
    
    func fetchMovies() {
        let request = MovieListRequest()
        service.request(request) { [weak self] result in
            switch result {
            case .success(let movies):
                self?.output?.displayMovies(
                    movies: movies.map {
                        MovieViewModel(
                            title: $0.title,
                            posterURL: String.init(format: "%@/%@", arguments: [Movie.baseURL, $0.posterPath ?? ""])
                        )
                    }
                )
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func setOutput(output: MovieListOutput) {
        self.output = output
    }
    
    func fetchImage(for url: String, completion: @escaping (Data?, Error?) -> Void) {
        imageFetcher.setImage(url: url, completion: completion)
    }
}
