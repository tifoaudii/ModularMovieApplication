//
//  UICollectionViewExtension.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 14/03/22.
//

import UIKit

extension UICollectionView {
    func register<T>(_ cell: T.Type) {
        let cellNib = UINib(nibName: String.init(describing: T.self), bundle: .module)
        register(cellNib, forCellWithReuseIdentifier: String.init(describing: T.self))
    }
    
    func dequeue<T>(_ cell: T.Type, for indexPath: IndexPath) -> T? {
        dequeueReusableCell(withReuseIdentifier: String.init(describing: cell), for: indexPath) as? T
    }
}
