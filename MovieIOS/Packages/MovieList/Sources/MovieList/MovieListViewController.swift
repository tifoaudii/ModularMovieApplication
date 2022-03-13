//
//  MovieListViewController.swift
//  
//
//  Created by Tifo Audi Alif Putra on 13/03/22.
//

import UIKit

public protocol MovieListDelegate {
    func fetchMovies(for viewController: MovieListViewController)
}

public final class MovieListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let delegate: MovieListDelegate
    
    init(delegate: MovieListDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: .module)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }

    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieCell.self)
    }
}

extension MovieListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeue(MovieCell.self, for: indexPath) else {
            return UICollectionViewCell()
        }
        
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.bounds.width / 2 , height: view.bounds.height / 3)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        .leastNormalMagnitude
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        12
    }
}

extension UICollectionView {
    func register<T>(_ cell: T.Type) {
        let cellNib = UINib(nibName: String.init(describing: T.self), bundle: .module)
        register(cellNib, forCellWithReuseIdentifier: String.init(describing: T.self))
    }
    
    func dequeue<T>(_ cell: T.Type, for indexPath: IndexPath) -> T? {
        dequeueReusableCell(withReuseIdentifier: String.init(describing: cell), for: indexPath) as? T
    }
}
