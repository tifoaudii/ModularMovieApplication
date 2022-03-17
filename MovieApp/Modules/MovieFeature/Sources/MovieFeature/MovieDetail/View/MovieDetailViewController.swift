//
//  MovieDetailViewController.swift
//  
//
//  Created by Tifo Audi Alif Putra on 16/03/22.
//

import UIKit
import Kingfisher

public protocol MovieDetailDelegate {
    func getMovieDetailViewModel() -> MovieDetailViewModel
}

final class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    
    private let delegate: MovieDetailDelegate
    
    init(delegate: MovieDetailDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: .module)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        renderMovie()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureGradient()
    }
    
    private func renderMovie() {
        let movieViewModel = delegate.getMovieDetailViewModel()
        title = movieViewModel.title
        movieTitle.text = movieViewModel.title
        movieOverview.text = movieViewModel.overview
        posterImage.kf.setImage(with: URL(string: movieViewModel.posterURL), placeholder: nil)
    }
    
    private func configureGradient() {
        gradientView.backgroundColor = UIColor(white: 1, alpha: 0)
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradientView.bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.cornerRadius = 0
        gradientLayer.startPoint = .init(x: 0.0, y: 0.0)
        gradientLayer.endPoint = .init(x: 0.0, y: 1.0)
        gradientView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func configureNavigationBar() {
        view.backgroundColor = .black
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .clear
        appearance.shadowImage = UIImage()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
    }
}
