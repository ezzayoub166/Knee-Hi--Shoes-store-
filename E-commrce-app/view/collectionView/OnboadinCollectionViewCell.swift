//
//  OnboadinCollectionViewCell.swift
//  Shoes-EcommApp
//
//  Created by ezz on 05/08/2024.
//

import UIKit

class OnboadinCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    
    @IBOutlet weak var subTitle: UILabel!
    
    var object : OnBoadingItem?
    
    static let identifier = "OnboadinCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(){
        if let object = object {
            image.image = UIImage(named: object.image ?? "")
            title.text = object.title
            subTitle.text = object.subTitle
        }
    }

}
