//
//  ImageRequest.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 15/03/22.
//

import Foundation

struct ImageRequest: Request {
    typealias Response = Data
    
    let url: String
    
    var method: HTTPMethod {
        .get
    }
}
