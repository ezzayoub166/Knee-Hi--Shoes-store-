//
//  newArrivalCollectionViewCell.swift
//  Shoes-EcommApp
//
//  Created by ezz on 06/08/2024.
//

import UIKit

class newArrivalCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titlelbl: UILabel!
    
    @IBOutlet weak var pricelabl: UILabel!
    
    @IBOutlet weak var shoesimg: UIImageView!
    static let identifier = "newArrivalCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with model : ShoeModel){
        self.shoesimg.sd_setImage(with: URL(string: model.images[0]))
        self.pricelabl.text = model.price + " $"
        self.titlelbl.text = model.title
    }

}
