//
//  PaymentVC.swift
//  Shoes-EcommApp
//
//  Created by ezz on 09/08/2024.
//

import UIKit

class PaymentVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

       isHiddenNavigation = true
    }
    
    @IBAction func paymentBtn(_ sender: Any) {
        let vc = UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: "OrderDeatilsVC")
        vc.push()
    }
    

}
