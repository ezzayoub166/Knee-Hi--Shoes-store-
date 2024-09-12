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
    
    func configure(model : Color,selected : Bool){
        if let view = colorView {
            view.backgroundColor = model.codeColor.color_
            if selected {
                colorView.borderColor = .gray
                colorView.borderWidth = 3
            }else {
                colorView.borderColor = .clear
                colorView.borderWidth = 0
            }

            
        }else{
            print("nill")
        }
    }
    
}

