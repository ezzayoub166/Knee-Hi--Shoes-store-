//
//  UIButtonEx.swift
//  ReviosnIOSTotourial
//
//  Created by ezz on 10/10/2023.
//

import Foundation
import UIKit
extension UIButton {
    @IBInspectable var selectedImage : UIImage?{
        set{
            self.setImage(newValue, for: .selected)
        }
        get{
            return self.image(for: .selected)
        }
    }
    
}
