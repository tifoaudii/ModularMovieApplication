//
//  MovieCell.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 12/03/22.
//

import UIKit
import ImageFetcher

final class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var movieThumbnail: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    private func configureCell() {
        movieThumbnail.layer.cornerRadius = 12
        movieThumbnail.contentMode = .scaleAspectFill
        movieThumbnail.clipsToBounds = true
        movieTitle.textColor = .white
        movieTitle.textAlignment = .center
        movieTitle.numberOfLines = 0
        movieTitle.font = .systemFont(ofSize: 16, weight: .bold)
    }

    func configureData(movie: MovieViewModel) {
        movieTitle.text = movie.title
        ImageService.shared().setImage(url: movie.posterURL) { data, error in
            guard let data = data, error == nil else {
                return
            }

            self.movieThumbnail.image = UIImage(data: data)
        }
    }
}
