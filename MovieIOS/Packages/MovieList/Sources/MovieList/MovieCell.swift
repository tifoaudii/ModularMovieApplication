//
//  MovieCell.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 12/03/22.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var movieThumbnail: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieThumbnail.image = .actions
        movieTitle.textColor = .white
        movieTitle.textAlignment = .center
        movieTitle.font = .systemFont(ofSize: 16, weight: .bold)
    }

}
