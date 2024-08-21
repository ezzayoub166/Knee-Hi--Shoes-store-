//
//  UIApplicationEx.swift
//  ReviosnIOSTotourial
//
//  Created by ezz on 10/10/2023.
//

import Foundation
import UIKit

extension UIApplication {
    class var topViewController : UIViewController? {
        if #available(iOS 13.0, *){
            let keyWindow = UIApplication.shared.windows.filter{
                $0.isKeyWindow
            }.first
            return keyWindow?.rootViewController?.topMostViewController
        }
        return UIApplication.shared.keyWindow?.rootViewController?.topMostViewController
    }
}


