//
//  UICollectionViewEx.swift
//  ReviosnIOSTotourial
//
//  Created by ezz on 22/04/2024.
//

import Foundation
import UIKit
extension UICollectionView {
    
    func registerNib(identifier:String){
        self.register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
    }
    
    func registerNib(cell : UICollectionViewCell.Type ){
        self.registerNib(identifier: String(describing: cell.self))
    }
    
  
        func dequeueCVCell<T: UICollectionViewCell>(indexPath:IndexPath) -> T {
            guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as? T else {
                fatalError("Could not locate viewcontroller with with identifier \(String(describing: T.self)) in storyboard.")
            }
            return cell
        }
            
        func registerCell(type: UICollectionViewCell.Type) {
            let id = String(describing: type)
            self.register(UINib(nibName: id, bundle: nil), forCellWithReuseIdentifier: id)
        }
        
}

extension UICollectionViewCell {
    static var id : String{
        return String(describing: Self.self)
    }
}
