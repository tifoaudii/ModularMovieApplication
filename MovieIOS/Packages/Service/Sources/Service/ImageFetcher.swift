//
//  ImageFetcher.swift
//  
//
//  Created by Tifo Audi Alif Putra on 15/03/22.
//

import Foundation

final class ImageService {
    private let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    func downloadImage(url: String, completion: @escaping (Result<Data, Error>) -> Void) {
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

public final class ImageFetcher {
    
    private let service: ImageService
    
    private init(configuration: URLSessionConfiguration) {
        self.service = ImageService(configuration: configuration)
    }
    
    private var cachedData: [String: Data] = [:]
    
    public static func shared(
        configuration: URLSessionConfiguration = .default
    ) -> ImageFetcher {
        return ImageFetcher(configuration: configuration)
    }
    
    
    public func setImage(url: String, completion: @escaping (Data?, Error?) -> Void) {
        if let image = cachedData[url] {
            completion(image, nil)
        } else {
            service.downloadImage(url: url) { [weak self] result in
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
}
