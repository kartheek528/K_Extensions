//
//  UICollectionView+Extension.swift
//  Legendary
//
//  Created by Kartheek Boggarapu on 24/12/19.
//  Copyright © 2019 Soffice. All rights reserved.
//

import Foundation

extension UICollectionView {
    func register<T: UICollectionViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: className)
    }
    
    func register<T: UICollectionViewCell>(cellTypes: [T.Type], bundle: Bundle? = nil) {
        cellTypes.forEach { register(cellType: $0, bundle: bundle) }
    }
    
    func register<T: UICollectionReusableView>(reusableViewType: T.Type,
                                               ofKind kind: String = UICollectionView.elementKindSectionHeader,
                                               bundle: Bundle? = nil) {
        let className = reusableViewType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: className)
    }
    
    func register<T: UICollectionReusableView>(reusableViewTypes: [T.Type],
                                               ofKind kind: String = UICollectionView.elementKindSectionHeader,
                                               bundle: Bundle? = nil) {
        reusableViewTypes.forEach { register(reusableViewType: $0, ofKind: kind, bundle: bundle) }
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type,
                                                      for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as! T
    }
    
    func dequeueReusableView<T: UICollectionReusableView>(with type: T.Type,
                                                          for indexPath: IndexPath,
                                                          ofKind kind: String = UICollectionView.elementKindSectionHeader) -> T {
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: type.className, for: indexPath) as! T
    }
}


//Usage:
//
//collectionView.register(cellType: MyCell.self)
//collectionView.register(cellTypes: [MyCell1.self, MyCell2.self])
//let cell = collectionView.dequeueReusableCell(with: MyCell.self, for: indexPath)
//
//collectionView.register(reusableViewType: MyReusableView.self)
//collectionView.register(reusableViewTypes: [MyReusableView1.self, MyReusableView2.self])
//let view = collectionView.dequeueReusableView(with: MyReusableView.self, for: indexPath)
