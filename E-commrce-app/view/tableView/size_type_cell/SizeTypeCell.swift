//
//  SizeTypeCell.swift
//  E-commrce-app
//
//  Created by ezz on 19/08/2024.
//

import UIKit

class SizeTypeCell : UICollectionViewCell {
    @IBOutlet weak var titlelbl: UILabel!
    
    static let identifier = "SizeTypeCell"
    
    func configure(name : String){
        titlelbl.text = name
    }
}
