//
//  AppDelegate.swift
//  Shoes-EcommApp
//
//  Created by ezz on 04/08/2024.
//

import UIKit
import Firebase
import IQKeyboardManagerSwift
import FirebaseMessaging

@main
class AppDelegate: UIResponder, UIApplicationDelegate , MessagingDelegate {
    
    static let shared = UIApplication.shared.delegate as? AppDelegate
    
    var rootNaviagtionController : MAINNavCon?
    
    static let main_sb = UIStoryboard(name: "Main", bundle: nil)




    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        for familyName in UIFont.familyNames {
//            for fontName in UIFont.fontNames(forFamilyName: familyName) {
//                print(fontName)
//            }
//        }
        Messaging.messaging().delegate = self
        print("FCM TOKEN:: \(Messaging.messaging().fcmToken ?? "")")
        IQKeyboardManager.shared.enable = true
        FirebaseApp.configure()
        return true
    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("FCM Token: \(fcmToken ?? "")")
        
        // Here, you might want to send the token to your app server for further processing.
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

