//
//  UserProfile.swift
//  ReviosnIOSTotourial
//
//  Created by ezz on 17/10/2023.
//

import Foundation
import UIKit
//this class contain all proprites effect on the profile
class UserProfile {
    //mmmmm
    static let shared = UserProfile()
    
    
    var isRTL : Bool {
        
        return UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft
    }
    
    let APPLE_LANGUAGE_KEY = "AppleLanguages"
    
    var currentLanguageKey : String?{
        let langs = UserDefaults.standard.value(forKey: APPLE_LANGUAGE_KEY) as? Array<String>
        return (langs?.first)
    }
    
    func currentAppleLanguage() -> String {
        let userdef = UserDefaults.standard
        let langArray = userdef.object(forKey: APPLE_LANGUAGE_KEY) as! NSArray
        let current = langArray.firstObject as! String
        let endIndex = current.startIndex
        let currentWithOutLocale = current.substring(to: current.index(endIndex, offsetBy: 2))
        return currentWithOutLocale
    }
    
    func currentAppleLanguageFull() -> String {
        let userRef = UserDefaults.standard
        let langArray = userRef.object(forKey: APPLE_LANGUAGE_KEY) as! NSArray
        let current = langArray.firstObject as! String
        return current
    }
    
    func setAppleLanguageTo(lang : String){
        let userRef = UserDefaults.standard
        userRef.set([lang,currentAppleLanguage()], forKey: APPLE_LANGUAGE_KEY)
        userRef.synchronize()
    }
    
}
