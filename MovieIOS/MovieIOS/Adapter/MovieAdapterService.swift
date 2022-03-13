//
//  MovieAdapterService.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 13/03/22.
//

import Service
import MovieList

final class MovieAdapterService: MovieListDelegate {
    
    private let service: NetworkService
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func fetchMovies(for viewController: MovieListViewController) {
        
    }
}
