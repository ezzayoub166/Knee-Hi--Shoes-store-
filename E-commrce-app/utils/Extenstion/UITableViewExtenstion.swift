//
//  UITableViewExtenstion.swift
//  ReviosnIOSTotourial
//
//  Created by ezz on 22/04/2024.
//

import Foundation
import UIKit
extension UITableView {
    
    func registerNib(identifier:String){
        self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
    func registerNib(cell : UITableViewCell.Type ){
        self.registerNib(identifier: String(describing: cell.self))
    }
}

extension UITableViewCell {
     static var id : String{
        return String(describing: Self.self)
    }
}
