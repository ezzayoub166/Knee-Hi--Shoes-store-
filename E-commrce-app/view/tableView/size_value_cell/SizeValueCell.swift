//
//  SizeValueCell.swift
//  E-commrce-app
//
//  Created by ezz on 19/08/2024.
//

import UIKit

class SizeValueCell  : UICollectionViewCell {
    
    @IBOutlet weak var valuelbl: UILabel!
    
    @IBOutlet weak var main_view: UIView!
    
    static let identifier = "SizeValueCell"
    
    func configure(value: Int) {
        if let label = valuelbl {
            label.text = "\(value)"
        } else {
            print("valuelbl is nil, check your connections and setup.")
        }
    }
    
    
    
}

