//
//  ImageFetcher.swift
//  
//
//  Created by Tifo Audi Alif Putra on 15/03/22.
//

import Foundation

public protocol ImageFetcher {
    func setImage(url: String, completion: @escaping (Data?, Error?) -> Void)
}

public final class ImageService: ImageFetcher {
    
    private let session: URLSession
    
    public init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    private var cachedData: [String: Data] = [:]
    
    public func setImage(url: String, completion: @escaping (Data?, Error?) -> Void) {
        if let data = cachedData[url] {
            DispatchQueue.main.async {
                completion(data, nil)
            }
        } else {
            downloadImage(url: url) { [weak self] result in
                switch result {
                case .success(let data):
                    self?.cachedData[url] = data
                    DispatchQueue.main.async {
                        completion(data, nil)
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                }
            }
        }
    }
    
    private func downloadImage(url: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: url) else {
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
        urlRequest.httpMethod = "GET"
        
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
            
            completion(.success(data))
        }
        .resume()
    }
}
