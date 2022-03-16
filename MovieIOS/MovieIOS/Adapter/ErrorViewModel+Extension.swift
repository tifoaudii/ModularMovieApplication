//
//  ErrorViewModel+Extension.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 16/03/22.
//

import Foundation
import MovieList

extension ErrorViewModel {
    init(error: Error) {
        self.init(
            title: "Oops, something went wrong",
            description: error.localizedDescription
        )
    }
}
