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

struct MovieListRequest: Request {
    
    private let apiKey: String = "ae5b867ee790efe19598ff6108ad4e02"
    
    var url: String {
        let baseURL: String = "https://api.themoviedb.org/3"
        let path: String = "/movie/popular"
        return baseURL + path
    }
    
    var queryItems: [String : String] {
        [
            "api_key": apiKey
        ]
    }
    
    var method: HTTPMethod {
        .get
    }
    
    func decode(_ data: Data) throws -> [Movie] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        let response = try decoder.decode(MoviesResponse.self, from: data)
        return response.results
    }
}


final class MovieAdapterService: MovieListDelegate {
    
    private let service: NetworkService
    
    weak var output: MovieListOutput?
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func fetchMovies() {
        let request = MovieListRequest()
        service.request(request) { result in
            switch result {
            case .success(let movies):
                print(movies)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func setOutput(output: MovieListOutput) {
        self.output = output
    }
}
