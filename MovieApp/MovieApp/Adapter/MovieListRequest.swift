//
//  MovieListRequest.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 15/03/22.
//

import Service
import MovieDomain
import Foundation

struct MovieListRequest: Request {
    
    private let apiKey: String = "register your API key"
    
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

