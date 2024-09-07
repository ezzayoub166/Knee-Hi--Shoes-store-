//
//  ExtentionsViewController.swift
//  ReviosnIOSTotourial
//
//  Created by ezz atallah on 05/09/2023.
//

import Foundation
import UIKit
import SDWebImage
//import PopupDialog
import SystemConfiguration

extension UIViewController {
    var isHiddenNavigation: Bool{
        set{
            self.navigationController?.setNavigationBarHidden(newValue, animated: true)
        }
        get{
            return self.navigationController?.isNavigationBarHidden ?? false
        }
    }
    
    
    
    
    var topMostViewController: UIViewController? {
        if let navigationController = self as? UINavigationController {
            return navigationController.topViewController?.topMostViewController
        } else if let tabBarController = self as? UITabBarController {
            if let selectedViewController = tabBarController.selectedViewController {
                return selectedViewController.topMostViewController
            }
            return tabBarController
        } else if let presentedViewController = self.presentedViewController {
            return presentedViewController.topMostViewController
        } else {
            return self
        }
    }

    func push(){
        AppDelegate.shared?.rootNaviagtionController?.pushViewController(self, animated: true)
    }
    func pop(){
        AppDelegate.shared?.rootNaviagtionController?.popViewController(animated: true)
    }
    func rootPush(){
        AppDelegate.shared?.rootNaviagtionController?.setViewControllers([self], animated: false)
    }
    func presentVC(){
        AppDelegate.shared?.rootNaviagtionController?.present(self, animated: true)
    }
    func safePerformSegue(withIdentifier identifier : String, sender:Any?){
        if canPerformSegue(identifier: identifier){
        self.performSegue(withIdentifier: identifier, sender: sender)
        }
    }
    func canPerformSegue(identifier: String) -> Bool {
          guard let identifiers = value(forKey: "storyboardSegueTemplates") as? [NSObject] else {
              return false
          }
          let canPerform = identifiers.contains { (object) -> Bool in
              if let id = object.value(forKey: "_identifier") as? String {
                  return id == identifier
              }else{
                  return false
              }
          }
          return canPerform
      }
    func showAlert(title : String? , message : String?,buttonTitle1 : String = "OK" , buttonTitle2:String = "Cancle", buttonAction1:@escaping(() -> Void),buttonAction2:(@escaping() -> Void)){
            let alert = UIAlertController(title:title, message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: buttonTitle1, style: .default,handler: {action in
            buttonAction1()
        })
            let cancelAction = UIAlertAction(title: buttonTitle2, style: .destructive) { action in
                buttonAction2()
            }
            alert.addAction(cancelAction)
            alert.addAction(okayAction)
            self.present(alert, animated: true)
    }
    
    func showAlert(title : String? , message : String?,buttonTitle1 : String = "OK", buttonAction1:@escaping(() -> Void)){
            let alert = UIAlertController(title:title, message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: buttonTitle1, style: .default,handler: {action in
            buttonAction1()
        })
            alert.addAction(okayAction)
            self.present(alert, animated: true)
    }
    
    func showErrorMessage(message : String?){
        let alert = UIAlertController(title:"Warrining", message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .destructive) { action in
            
        }
        
        alert.addAction(cancelAction)
       self.present(alert, animated: true)
    }

    func shareLink(link: String) {
        let activityViewController = UIActivityViewController(activityItems: [link], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    func statusColor(isLight : Bool = true) {
        return UIApplication.shared.statusBarStyle = isLight ? .lightContent : .default
    }
    
    func customBack(name: String) {
        let yourBackImage = name.toImage
        navigationController?.navigationBar.backIndicatorImage = yourBackImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
    }
    
    func BackWordTitle(title: String)  {
        let backButton = UIBarButtonItem()
        backButton.title = title
        backButton.setTitleTextAttributes([
            NSAttributedString.Key.font: MyTools.appFont(size: 18)],
                                          for: .normal)
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    func PopupVC(vc: UIViewController, background: UIColor = .white,tapDismissal: Bool = false,panDismissal: Bool = false) {
        let width = self.view.frame.size.width
        let popup = PopupDialog(viewController: vc,
                                buttonAlignment: .horizontal,
                                transitionStyle: .zoomIn,
                                preferredWidth: width,
                                tapGestureDismissal: tapDismissal,
                                panGestureDismissal: panDismissal,
                                hideStatusBar: false,
                                completion: nil)
        popup.view.backgroundColor = background
        self.present(popup, animated: true, completion: nil)
    }

    func showToast(_ message:String, backgroundColor : UIColor = color_517FF6) {
        let snackbar: TTGSnackbar = TTGSnackbar(message: message, duration: .middle)
        
        // Change the content padding inset
        snackbar.contentInset = UIEdgeInsets.init(top: 8, left: 8, bottom: 7, right: 8)
        
        // Change margin
        snackbar.leftMargin = 0
        snackbar.rightMargin = 0
//        snackbar.topMargin = 0
        snackbar.bottomMargin = 0
//        snackbar.cornerRadius = 0.0
        
        // Change message text font and color
        snackbar.backgroundColor = backgroundColor
        snackbar.messageTextColor = .white
        snackbar.messageTextFont = MyTools.appFont(size: 15)
        snackbar.messageTextAlign = .left
        
        // Change animation duration
        snackbar.animationDuration = 0.5
        
        // Animation type
        snackbar.animationType = .slideFromBottomBackToBottom
        snackbar.show()
    }
    
    func showOkAlert(title:String = "",message:String) {
        
        // Create the dialog
        let width = self.view.frame.size.width - 60
        let popup = PopupDialog(title: title, message: message ,
                                buttonAlignment: .horizontal,
                                transitionStyle: .zoomIn, preferredWidth: width,
                                tapGestureDismissal: false,
                                panGestureDismissal: false, hideStatusBar: false) {}
        
        let dialogAppearance = PopupDialogDefaultView.appearance()
        let align =  NSTextAlignment.center
//        dialogAppearance.titleFont            = MyTools.tool.appFont(size: 17)
//        dialogAppearance.messageFont          = MyTools.tool.appFont(size: 15)
        dialogAppearance.messageTextAlignment = align
        dialogAppearance.titleTextAlignment   = align
        
        let okButton = DefaultButton(title: "Ok") {
            popup.dismiss()
        }
//        okButton.titleColor = Constant.PrimaryColor
//        okButton.titleFont = MyTools.tool.appFont(size: 16)
        popup.addButton(okButton)
        self.present(popup, animated: true, completion: nil)
    }
    
    func showCustomAlert(both: Bool,
                         title:String = "",
                         message:String,
                         accept:String = "Yes",
                         cancel:String = "Cancel",
                         completion:@escaping (Bool) -> Void) {
        
        let width = self.view.frame.size.width
        //            - 60
        
        let popup = PopupDialog(title: title, message: message ,
                                buttonAlignment: .horizontal,
                                transitionStyle: .zoomIn,
                                preferredWidth: width,
                                tapGestureDismissal: false,
                                panGestureDismissal: false, hideStatusBar: false) {}
        
        let dialogAppearance = PopupDialogDefaultView.appearance()
        let align =  NSTextAlignment.center
        dialogAppearance.backgroundColor      = .white
        //        dialogAppearance.titleFont            = MyTools.tool.appFont(size: 17)
        //        dialogAppearance.titleColor           = Constant.PrimaryColor
        dialogAppearance.titleTextAlignment   = align
        //        dialogAppearance.messageFont          = MyTools.tool.appFont(size: 15)
        dialogAppearance.messageColor         = "9B9B9B".color_
        dialogAppearance.messageTextAlignment = align
        
        let cancelButton = CancelButton(title: cancel) {
            completion(false)
            popup.dismiss()
        }
        
        
        cancelButton.titleColor = .red
        //        cancelButton.titleFont = MyTools.tool.appFont(size: 16)
        
        let okButton = DefaultButton(title: accept) {
            completion(true)
        }
        //        okButton.titleColor = Constant.PrimaryColor
        //        okButton.titleFont = MyTools.tool.appFont(size: 16)
        
        
        if !both {
            popup.addButton(okButton)
        }else{
            popup.addButtons([okButton,cancelButton])
        }
        
        self.present(popup, animated: true, completion: nil)
    }
    
    func showOkAlertWithComp(title:String,message:String,completion:@escaping (Bool) -> Void) {
        
        let width = self.view.frame.size.width - 60
        let popup = PopupDialog(title: title, message: message ,
                                buttonAlignment: .horizontal,
                                transitionStyle: .zoomIn, preferredWidth: width,
                                tapGestureDismissal: false,
                                panGestureDismissal: false, hideStatusBar: false) {}
        
        
        let dialogAppearance = PopupDialogDefaultView.appearance()
        let align =  NSTextAlignment.center
        
//        dialogAppearance.titleFont            = MyTools.tool.appFont(size: 17)
//        dialogAppearance.messageFont          = MyTools.tool.appFont(size: 15)
        dialogAppearance.messageTextAlignment = align
        dialogAppearance.titleTextAlignment   = align
        
        let okButton = DefaultButton(title: "Ok") {
            completion(true)
        }
        
//        okButton.titleColor = Constant.PrimaryColor
//        okButton.titleFont = MyTools.tool.appFont(size: 16)
        popup.addButton(okButton)
        self.present(popup, animated: true, completion: nil)
    }
        
    // Indicator
    func showIndicator(message : String = "Please wait...") {
        SKActivityIndicator.spinnerStyle(.spinningFadeCircle)
        SKActivityIndicator.spinnerColor("2D4757".color_)
        SKActivityIndicator.statusTextColor("2D4757".color_)
        SKActivityIndicator.show(message, userInteractionStatus: false)
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    
    func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
    
    func RootViewController(viewController:UIViewController) {
        guard let window = UIApplication.shared.keyWindow else { return }
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
    
    func RootNavViewController(viewController:UIViewController) {
        guard let window = UIApplication.shared.keyWindow else { return }
        let nav = UINavigationController.init(rootViewController: viewController)
        window.rootViewController = nav
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }

//    func popVC(_ animated:Bool = true) {
//        self.navigationController?.pop(animated: animated)
//    }
//    
//    func popToRoot(_ animated:Bool = true) {
//        self.navigationController?.popToRoot(animated: animated)
//    }
    
    func pushNavVC(_ vc:UIViewController,_ animated:Bool = true) {
        self.navigationController?.pushViewController(vc, animated: animated)
    }
    
    func setVCs(_ vcs:[UIViewController],_ animated:Bool = true) {
        self.navigationController?.setViewControllers(vcs, animated: animated)
    }
    
    func presentVC(_ vc:UIViewController,_ animated:Bool = true) {
        self.present(vc, animated: animated, completion: nil)
    }
    
    func presentModal(_ vc:UIViewController,_ animated:Bool = true) {
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .custom
        self.present(vc, animated: animated, completion: nil)
    }

    func presentNav(_ vc:UIViewController,_ animated:Bool = true) {
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: animated, completion: nil)
    }

    func dismissVC(_ animated:Bool = true,_ completion: (() -> Void)? = nil) {
        self.dismiss(animated: animated, completion: completion)
    }
    
}
