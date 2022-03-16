//
//  NetworkService.swift
//  
//
//  Created by Tifo Audi Alif Putra on 13/03/22.
//

import Foundation

public protocol NetworkService {
    func request<R: Request>(_ request: R, completion: @escaping (Result<R.Response, Error>) -> Void)
}

public final class URLSessionNetworkService: NetworkService {
    
    private let session: URLSession
    
    public init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    
    public func request<R: Request>(_ request: R, completion: @escaping (Result<R.Response, Error>) -> Void) {
        
        guard var urlComponent = URLComponents(string: request.url) else {
            let error = NSError(
                domain: ErrorResponse.invalidEndpoint.rawValue,
                code: 404,
                userInfo: [
                    NSLocalizedDescriptionKey: "Invalid Endpoint"
                ]
            )
            
            return completion(.failure(error))
        }
        
        var queryItems: [URLQueryItem] = []
        
        request.queryItems.forEach {
            let urlQueryItem = URLQueryItem(name: $0.key, value: $0.value)
            urlComponent.queryItems?.append(urlQueryItem)
            queryItems.append(urlQueryItem)
        }
        
        urlComponent.queryItems = queryItems
        
        guard let url = urlComponent.url else {
            let error = NSError(
                domain: ErrorResponse.invalidEndpoint.rawValue,
                code: 404,
                userInfo: [
                    NSLocalizedDescriptionKey: "Invalid Endpoint"
                ]
            )
            
            return completion(.failure(error))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        
        session.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                return completion(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                return completion(.failure(
                    NSError(
                        domain: ErrorResponse.invalidResponse.rawValue,
                        code: -1,
                        userInfo: [
                            NSLocalizedDescriptionKey: "Invalid Response"
                        ]
                )))
            }
            
            guard let data = data else {
                return completion(.failure(
                    NSError(
                        domain: ErrorResponse.noData.rawValue,
                        code: -1,
                        userInfo: [
                            NSLocalizedDescriptionKey: "Data is Nil"
                        ]
                    )
                ))
            }
            
            do {
                try completion(.success(request.decode(data)))
            } catch let error as NSError {
                completion(.failure(error))
            }
        }
        .resume()
    }
}

