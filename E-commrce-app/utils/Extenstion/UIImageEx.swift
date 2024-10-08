////
////  UIImageEx.swift
////  E-commrce-app
////
////  Created by ezz on 29/08/2024.
////
//
import Foundation
import UIKit



extension UIImageView {
  
    func setImage(url:String){
        
        let activityInd = UIActivityIndicatorView()
        activityInd.center = CGPoint(x: self.frame.size.width  / 2,
                                     y: self.frame.size.height / 2)
        activityInd.color = UIColor.gray
        self.addSubview(activityInd)
        activityInd.startAnimating()
        self.sd_setImage(with: URL(string: url)) { _, _, _, _ in
            activityInd.stopAnimating()
        }

//        self.kf.setImage(with: URL(string: url), placeholder: UIImage(named: "placeholder2"), options: .none) { _ in
//            activityInd.stopAnimating()
//        }
        
    }
}
