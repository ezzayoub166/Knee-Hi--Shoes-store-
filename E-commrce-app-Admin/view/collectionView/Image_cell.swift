//
//  Image_cell.swift
//  E-commrce-app-Admin
//
//  Created by ezz on 26/08/2024.
//

import Foundation
import UIKit
class ImageCell : UICollectionViewCell  {
    static let identifier = "ImageCell"
    
    @IBOutlet weak var coverImage: UIImageView!
    
    func configure(image : UIImage){
        self.coverImage.image = image
        
    }
    
}
