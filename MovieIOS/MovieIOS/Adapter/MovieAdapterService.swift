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
    
    init(service: NetworkService, imageFetcher: ImageFetcher) {
        self.service = service
        self.imageFetcher = imageFetcher
    }
    
    func fetchMovies(completion: @escaping ([MovieViewModel], Error?) -> Void) {
        let request = MovieListRequest()
        service.request(request) { result in
            switch result {
            case .success(let movies):
                DispatchQueue.main.async {
                    completion(movies.map {
                        MovieViewModel(movie: $0)
                    }, nil)
                }
            case .failure(let error):
                completion([], error)
            }
        }
    }
    
    func fetchImage(for url: String, completion: @escaping (Data?, Error?) -> Void) {
        imageFetcher.setImage(url: url, completion: completion)
    }
}
