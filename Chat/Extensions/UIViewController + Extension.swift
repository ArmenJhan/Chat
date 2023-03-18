//
//  UIViewController + Extension.swift
//  Chat
//
//  Created by Armen Madoyan on 16.03.2023.
//

import UIKit

extension UIViewController {
    
    func configure<T: SelfConfigureCellProtocol, U: Hashable>(collectionView: UICollectionView, cellType: T.Type, withType value: U, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else { fatalError("Unable to dequeue \(cellType)") }
        cell.configure(with: value)
        return cell
    }
    
}
