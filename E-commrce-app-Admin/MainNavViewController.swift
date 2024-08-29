////
////  MainNaigationController.swift
////  ReviosnIOSTotourial
////
////  Created by ezz atallah on 16/08/2023.
////
//
//import UIKit
//
//class MainNavViewController: UINavigationController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupView()
//        localized()
//        fetchData()
//        setupData()
//
//        // Do any additional setup after loading the view.
//    }
//    
//
//}
//
//extension MainNavViewController {
//    func setupView(){
//        AppDelegate.shared?.rootNaviagtionController = self
//        setRoot()
//        if #available(iOS 15, *){
//            let appernce = UINavigationBarAppearance()
//            appernce.configureWithOpaqueBackground()
//            appernce.backgroundColor = "#FFFFFF".color_
//            appernce.shadowColor = .clear
//            appernce.titleTextAttributes = [NSAttributedString.Key.foregroundColor : "#1B1D28".color_, NSAttributedString.Key.font : UIFont.init(name: "AirbnbCereal_W_Bd", size: 18)]
//            self.navigationBar.standardAppearance = appernce
//            self.navigationBar.scrollEdgeAppearance = appernce
//            
//        }else {
//            self.navigationBar.setBackgroundImage(UIImage(), for: .default)
//            self.navigationBar.isTranslucent = false
//            self.navigationBar.barTintColor = "#FFFFFF".color_
//            self.navigationBar.backgroundColor = "#FFFFFF".color_
//            self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : "#1B1D28".color_, NSAttributedString.Key.font : UIFont.init(name: "AirbnbCereal_W_Bd", size: 18)]
//        }
//        self.navigationBar.tintColor = "#222158".color_
//        
////        AppDelegate.shared?.rootNaviagtionController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white , NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]
//        
//        
//        
//    }
//    func localized(){
//        
//    }
//    func fetchData(){
//        
//    }
//    func setupData(){
//        
//    }
//}
//extension MainNavViewController  {
//    func setRoot(){
//        let vc = UIStoryboard.mainAdminStoryBoard.instantiateViewController(withIdentifier: "MainAdminViewController")
//        vc.rootPush()
//    }
//}
