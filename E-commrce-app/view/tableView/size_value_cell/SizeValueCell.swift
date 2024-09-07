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
    
    func configure(with value: Int, isSelected: Bool) {
        
        
        if let label = valuelbl {
            label.text = "\(value)"
            label.textColor = isSelected ? .white : "#707B81".color_
            main_view.backgroundColor = isSelected ? "#5B9EE1".color_ : "#F8F9FA".color_
            
        } else {
            print("valuelbl is nil, check your connections and setup.")
        }
        
        
        
    
    }
}

