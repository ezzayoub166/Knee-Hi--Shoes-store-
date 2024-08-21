//
//  Route.swift
//  Shoes-EcommApp
//
//  Created by ezz on 13/08/2024.
//

import UIKit
import Foundation

class Route : NSObject {
    
    
    static func main_appearance() {
        
        let nav = UINavigationBar.appearance()
        
        // Backword Image
        let backArrowImage = UIImage(named: "ic_backArrow")
        let renderedImage = backArrowImage?.withRenderingMode(.alwaysOriginal)
        
        nav.shadowImage = UIImage()
        nav.isTranslucent = false
        nav.barTintColor = color_F0F4FB
        nav.backIndicatorImage = renderedImage
        nav.backIndicatorTransitionMaskImage = renderedImage
        
        nav.titleTextAttributes = [
            NSAttributedString.Key.font: MyTools.appFont(name: .Medium, size: 16),
            NSAttributedString.Key.foregroundColor: color_517FF6 ]
        
        UITabBar.appearance().barTintColor = .white
    }
    
    static func is_logged() {
        if Auth_User._isLoggedIn {
            go_home()
        }else{
            go_login()
        }
    }
    
    static func go_home() {
        let vc = UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: "shoesTabBarVC")
        vc.rootPush()
    }
    
    static func go_login() {
        let vc : LoginVC = AppDelegate.main_sb.instance_vc()
        vc.rootPush()
    }
    
    //MARK: Alert
    static func showAlert(_ msg: String) {
        topVC()?.showOkAlert(message: msg)
    }
    
    //MARK: TopVC
    static func topVC() -> UIViewController? {
        if let top_vc = UIApplication.topViewController {
            return top_vc
        }
        return nil
    }
 
//    static func launch_friend_observer() {
//        if let appdelegate = UIApplication.shared.delegate as? AppDelegate {
//            appdelegate.save_friends_db()
//        }
//    }
}
