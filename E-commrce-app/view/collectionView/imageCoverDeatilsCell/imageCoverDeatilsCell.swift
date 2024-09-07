//
//  imageCoverDeatilsCell.swift
//  E-commrce-app
//
//  Created by ezz on 07/09/2024.
//

import UIKit

class imageCoverDeatilsCell: UICollectionViewCell {
    
    static let identifier = "imageCoverDeatilsCell"
    
    @IBOutlet weak var imageCover: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(imageUrl : String){
        let validImage = imageUrl.isEmpty ? notFoundImage : imageUrl
        imageCover.sd_setImage(with: URL(string: validImage))
    }
    
     var notFoundImage = "https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png"


}
