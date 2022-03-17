//
//  MovieListDelegateSpy.swift
//  
//
//  Created by Tifo Audi Alif Putra on 16/03/22.
//

import Foundation
import MovieFeature

class MovieListDelegateSpy: MovieListDelegate {
    
    var fetchMoviesCalled = false
    var completionHandler: (([MovieViewModel], ErrorViewModel?) -> Void)?
    
    func fetchMovies(completion: @escaping ([MovieViewModel], ErrorViewModel?) -> Void) {
        fetchMoviesCalled = true
        completionHandler = completion
    }
}
