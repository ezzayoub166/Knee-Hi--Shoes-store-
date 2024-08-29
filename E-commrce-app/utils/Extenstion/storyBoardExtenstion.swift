//
//  storyBoardExtenstion.swift
//  ReviosnIOSTotourial
//
//  Created by ezz atallah on 16/08/2023.
//

import Foundation
import UIKit
extension UIStoryboard {
    static let mainStoryBoard = UIStoryboard.init(name: "Main", bundle: nil)
    
    static let mainAdminStoryBoard = UIStoryboard.init(name: "Main_Admin", bundle: nil)

    

        func instance_vc<T: UIViewController>() -> T {
            guard let vc = instantiateViewController(withIdentifier: String(describing: T.self)) as? T else {
                fatalError("Could not locate viewcontroller with with identifier \(String(describing: T.self)) in storyboard.")
            }
            return vc
        }
}
