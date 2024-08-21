//
//  LoginVC.swift
//  Shoes-EcommApp
//
//  Created by ezz on 05/08/2024.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var email_txt: UITextField!
    
    @IBOutlet weak var password_txt: UITextField!
    
    
    @IBOutlet weak var hidePass_btn: UIButton!
    
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    lazy var textFiles = [email_txt ,password_txt ]
    
    var iconClick = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isHiddenNavigation = true
        setUpTextFileds()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        #if DEBUG
        email_txt.text = "ezzdine484@gmail.com"
        password_txt.text = "12345678"
        #endif
        
    }
    
    @IBAction func hidePass_btn(_ sender: Any) {
        if iconClick {
               password_txt.isSecureTextEntry = false
            self.hidePass_btn.setImage(UIImage(systemName: "eye"), for: .normal)
            
           } else {
               password_txt.isSecureTextEntry = true
               self.hidePass_btn.setImage(UIImage(systemName: "eye.slash"), for: .normal)
           }
           iconClick = !iconClick
        
    }

    
    private func setUpTextFileds(){
        email_txt.returnKeyType = .next
        password_txt.returnKeyType = .done
        textFiles.forEach({$0?.delegate = self})
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let selectedTextFieldIndex = textFiles.firstIndex(of: textField), selectedTextFieldIndex < textFiles.count - 1 {
            textFiles[selectedTextFieldIndex + 1]?.becomeFirstResponder()
        } else {
            textField.resignFirstResponder() // last textfield, dismiss keyboard directly
        }
        return true
    }
    
    @IBAction func signInBtn(_ sender: Any) {
        guard let email = email_txt.text , !email.TrimWhiteSpaces.isEmpty else {
            self.showToast(Auth_Strings.Message(.EmailRequired))
            return
            
        }
        guard email.isEmailValid else {
            self.showToast(Auth_Strings.Message(.InvalidEmail))
            return
        }
        guard let Password = password_txt.text, !Password.TrimWhiteSpaces.isEmpty else {
            self.showToast(Auth_Strings.Message(.PasswordRequired))
            return
        }
        
        
        self.showIndicator()
        Requests.login(email: email, password: Password) {
            Route.go_home()
        }
        
    }
    @IBAction func signUpBtn(_ sender: Any) {
        let vc = UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: "RegisterVC")
        vc.push()
        
    }
    
    @IBAction func recoveryPassBtn(_ sender: Any) {
        let vc = UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: "RecoveryPasswordVC")
        vc.push()
        
    }
}
