//
//  selectedCategoriesCollectionViewCell.swift
//  Shoes-EcommApp
//
//  Created by ezz on 06/08/2024.
//

import UIKit

class selectedCategoriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    
    @IBOutlet weak var titlelbl: UILabel!
    
    @IBOutlet weak var mainView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    
    static let identifier = "selectedCategoriesCollectionViewCell"

    func configure(model : Category_Item) {
        titlelbl.text = model.title
        image.sd_setImage(with: URL(string: model.image_url ?? ""))
//         titlelbl.isHidden = !isSelected
         // Adjust other properties based on selection state
     }

}
