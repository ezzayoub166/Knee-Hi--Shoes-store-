//
//  Auth_user.swift
//  Shoes-EcommApp
//
//  Created by ezz on 13/08/2024.
//

import Foundation
import UIKit
import IQKeyboardManagerSwift
import Firebase
import SystemConfiguration
import SDWebImage
import AVKit

struct Auth_User {
    
//    static var _firstLoad : Bool {
//        get {
//            let ud = UserDefaults.standard
//            return ud.value(forKey: "firstLoad") as? Bool ?? true
//        }
//        set(firstLoad) {
//            let ud = UserDefaults.standard
//            ud.set(firstLoad, forKey: "firstLoad")
//            ud.synchronize()
//        }
//    }
    
//    static var FB_AutoKey : String {
//        get {
//            return Constant.dbPath.childByAutoId().key ?? MyTools.randomString(length: 10)
//        }
//    }

    static var _isLoggedIn : Bool {
        get {
            return (_Token != "")
        }
    }
    
//    static var _UserInfo : DBUser? {
//        get {
//            return RealmFunction.tool.getUserById(UserId: _Token)
//        }
//    }

    static var _Token : String {
        get {
            let ud = UserDefaults.standard
            return ud.value(forKey: "token") as? String ?? ""
        }
        set(token) {
            let ud = UserDefaults.standard
            ud.set(token, forKey: "token")
            ud.synchronize()
        }
    }
    
//    static var CheckCount : Int {
//        get {
//            let ud = UserDefaults.standard
//            return ud.value(forKey: "CheckCount") as? Int ?? 0
//        }
//        set(count) {
//            let ud = UserDefaults.standard
//            ud.set(count, forKey: "CheckCount")
//            ud.synchronize()
//        }
//    }

    static var _Password : String {
        get {
            let ud = UserDefaults.standard
            return ud.value(forKey: "password") as? String ?? ""
        }
        set(password) {
            let ud = UserDefaults.standard
            ud.set(password, forKey: "password")
            ud.synchronize()
        }
    }

    static func removeUserInfo() {
        let ud = UserDefaults.standard
        ud.removeObject(forKey: "token")
        ud.removeObject(forKey: "password")
        ud.removeObject(forKey: "CheckCount")
        ud.synchronize()
    }
    
    static func topVC() -> UIViewController? {
        if let top_vc = UIApplication.topViewController {
            return top_vc
        }
        return nil
    }

    static func ShowAlert(msg: String, _ isAlert : Bool = true) {
        if isAlert {
            topVC()?.showOkAlert(title: "", message: msg)
        }else{
            topVC()?.showToast(msg)
        }
    }
    
    static func AlertError(error: Error?, completion: @escaping () -> Void) {
        if error != nil {
            topVC()?.hideIndicator()
            topVC()?.showOkAlert(title: "", message: error?.localizedDescription ?? "")
        }else{
            completion()
        }
    }
}
