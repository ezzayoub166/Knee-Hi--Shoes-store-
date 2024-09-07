//
//  favouriteItemCollectionViewCell.swift
//  Shoes-EcommApp
//
//  Created by ezz on 08/08/2024.
//

import UIKit

class favouriteItemCollectionViewCell: UICollectionViewCell {
    
    
    static let  identifier = "favouriteItemCollectionViewCell"
    
    @IBOutlet weak var imageCover: UIImageView!
    
    @IBOutlet weak var title_shoes: UILabel!
    
    @IBOutlet weak var price_shose: UILabel!
    
    @IBOutlet weak var color_one: UIView!
    
    @IBOutlet weak var color_tow: UIView!
    
    func configure(model : Shose_model){
        imageCover.sd_setImage(with: URL(string: model.images[0]))
        title_shoes.text = model.title
        price_shose.text = model.price! + " $"
        if(model.colors.count == 1){
            color_one.backgroundColor = model.colors[0].codeColor?.color_
            color_tow.isHidden = true
        }else if (model.colors.count > 1 ){
            color_one.backgroundColor = model.colors[0].codeColor?.color_
            color_tow.backgroundColor = model.colors[1].codeColor?.color_
        }
    }
    
}
