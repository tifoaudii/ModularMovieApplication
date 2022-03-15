//
//  MovieCell.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 12/03/22.
//

import UIKit
import Service

final class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var movieThumbnail: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieThumbnail.image = .actions
        movieTitle.textColor = .white
        movieTitle.textAlignment = .center
        movieTitle.numberOfLines = 0
        movieTitle.font = .systemFont(ofSize: 16, weight: .bold)
    }

    func configureData(movie: MovieViewModel) {
        movieTitle.text = movie.title
    }
    
    func downloadImage(posterUrl: String, delegate: MovieListDelegate) {
        delegate.fetchImage(for: posterUrl) { data, error in
            guard let data = data, error == nil else {
                return
            }

            self.movieThumbnail.image = UIImage(data: data)
        }
    }
}
