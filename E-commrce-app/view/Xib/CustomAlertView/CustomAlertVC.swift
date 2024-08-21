//
//  CustomAlertVC.swift
//  Shoes-EcommApp
//
//  Created by ezz on 11/08/2024.
//

import UIKit

class CustomAlertVC: UIViewController {
    
    
    init() {
        super.init(nibName: "CustomAlertVC", bundle: Bundle(for: CustomAlertVC.self))
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show() {
//        if #available(iOS 13, *) {
//            UIApplication.shared.windows.first?.rootViewController?.present(self, animated: true, completion: nil)
//        } else {
//            UIApplication.shared.keyWindow?.rootViewController!.present(self, animated: true, completion: nil)
//        }
        self.presentVC()
    }
    
    
    @IBAction func backToShoppingBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
