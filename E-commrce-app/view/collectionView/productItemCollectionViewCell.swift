//
//  productItemCollectionViewCell.swift
//  Shoes-EcommApp
//
//  Created by ezz on 06/08/2024.
//

import UIKit

class productItemCollectionViewCell: UICollectionViewCell {
    
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
}
