//
//  productItemCollectionViewCell.swift
//  Shoes-EcommApp
//
//  Created by ezz on 06/08/2024.
//

import UIKit

class productItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var img_shose: UIImageView!
    
    @IBOutlet weak var title_shose: UILabel!
    
    @IBOutlet weak var price_shose: UILabel!
    
    @IBOutlet weak var addBtn: UIButton!{
        didSet{
            self.addBtn.roundCorners(corners: [.topLeft,.bottomRight], radius: 10)
        }
    }
    
    
    
    static let identifier = "productItemCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func addBtn(_ sender: Any) {
    }
    
    func configure(model : ShoeModel){
        self.img_shose.sd_setImage(with: URL(string: model.images[0]))
        self.img_shose.contentMode = .scaleAspectFit
        self.title_shose.text = model.title
        self.price_shose.text = model.price + " $"
        
        

        
    }
}
