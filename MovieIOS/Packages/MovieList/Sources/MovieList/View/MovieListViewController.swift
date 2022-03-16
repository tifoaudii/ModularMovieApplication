//
//  MovieListViewController.swift
//  
//
//  Created by Tifo Audi Alif Putra on 13/03/22.
//

import UIKit

public protocol MovieListDelegate {
    func fetchMovies(completion: @escaping ([MovieViewModel], Error?) -> Void)
    func fetchImage(for url: String, completion: @escaping (Data?, Error?) -> Void)
}

final class MovieListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let delegate: MovieListDelegate
    
    private var movies: [MovieViewModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    init(delegate: MovieListDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: .module)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate.fetchMovies { [weak self] (movies: [MovieViewModel], error: Error?) in
            guard error == nil else {
                return
            }
            
            self?.movies = movies
        }
        configureCollectionView()
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        appearance.shadowImage = UIImage()
        
        navigationController?.navigationItem.title = "Movies"
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
    }

    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieCell.self)
    }
}

extension MovieListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeue(MovieCell.self, for: indexPath) else {
            return UICollectionViewCell()
        }
        
        cell.configureData(movie: movies[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.bounds.width / 2 , height: view.bounds.height / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        .leastNormalMagnitude
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        12
    }
}

