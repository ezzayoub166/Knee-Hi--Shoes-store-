//
//  ColorCell.swift
//  E-commrce-app
//
//  Created by ezz on 19/08/2024.
//

import UIKit

class ColorCell : UICollectionViewCell{
    static let identifier = "ColorCell"
    
    @IBOutlet weak var colorView: UIView!
    
    func configure(model : Color){
        if let view = colorView {
            view.backgroundColor = model.codeColor.color_
            
        }else{
            print("nill")
        }
    }
    
}
