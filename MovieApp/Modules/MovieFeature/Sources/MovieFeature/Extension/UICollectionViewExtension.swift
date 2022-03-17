//
//  UICollectionViewExtension.swift
//  MovieIOS
//
//  Created by Tifo Audi Alif Putra on 14/03/22.
//

import UIKit

extension UICollectionView {
    func register<T>(_ cell: T.Type) {
        let nibName = String.init(describing: T.self)
        let cellNib = UINib(nibName: nibName, bundle: .module)
        register(cellNib, forCellWithReuseIdentifier: nibName)
    }
    
    func dequeue<T>(_ cell: T.Type, for indexPath: IndexPath) -> T? {
        let reuseIdentifier = String.init(describing: T.self)
        let cell = dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? T
        return cell
    }
}
