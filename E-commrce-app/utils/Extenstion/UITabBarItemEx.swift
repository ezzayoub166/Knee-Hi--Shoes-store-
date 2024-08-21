//
//  UITabBarItemEx.swift
//  ReviosnIOSTotourial
//
//  Created by ezz on 11/10/2023.
//

import Foundation
import UIKit
extension UITabBar {
    @IBInspectable var nonSelectedColor : UIColor?{
        set{
            self.unselectedItemTintColor = newValue
        }
        get{
            return self.unselectedItemTintColor
        }
    }
    //when the icon for tabBar we need to set always original image
    //lecture 18 in 42 m
    @IBInspectable var isRenderOriginal : Bool{
        set{
            guard newValue != false else{return}
            for(index,item) in (self.items ?? []).enumerated(){
                let image = item.selectedImage?.withRenderingMode(.alwaysOriginal)
                self.items?[index].selectedImage = image
            }
        }
        get{
            return false
        }
    }
}
