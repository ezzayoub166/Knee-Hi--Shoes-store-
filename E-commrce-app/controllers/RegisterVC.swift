//
//  RegisterVC.swift
//  Shoes-EcommApp
//
//  Created by ezz on 05/08/2024.
//

import UIKit
import Firebase
import FirebaseFirestore


class RegisterVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nametxt: UITextField!
    
    @IBOutlet weak var emailtxt: UITextField!
    
    @IBOutlet weak var passwordtxt: UITextField!
    
    @IBOutlet weak var mobileNumbertxt: UITextField!
    @IBOutlet weak var hidePasswordBtn: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    lazy var textFields = [nametxt,emailtxt,mobileNumbertxt,passwordtxt]
    
    var iconClick = true

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFields.forEach { filed in
            if filed == passwordtxt {
                filed?.returnKeyType = .done
            }else{
                filed?.returnKeyType = .next
                
            }
        }
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        textFields.forEach { $0?.delegate = self }
        #if DEBUG
        nametxt.text = "Izzdine Atallah"
        emailtxt.text = "ezzdine484@gmail.com"
        passwordtxt.text = "12345678"
        mobileNumbertxt.text = "11234567890"
        #endif
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func hidePasswordBtn(_ sender: Any) {
        if iconClick {
               passwordtxt.isSecureTextEntry = false
            self.hidePasswordBtn.setImage(UIImage(systemName: "eye"), for: .normal)
            
           } else {
               passwordtxt.isSecureTextEntry = true
               self.hidePasswordBtn.setImage(UIImage(systemName: "eye.slash"), for: .normal)
           }
           iconClick = !iconClick
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let selectedTextFieldIndex = textFields.firstIndex(of: textField), selectedTextFieldIndex < textFields.count - 1 {
            textFields[selectedTextFieldIndex + 1]?.becomeFirstResponder()
        } else {
            textField.resignFirstResponder() // last textfield, dismiss keyboard directly
        }
        return true
    }
    
    @IBAction func signInBtn(_ sender: Any) {
        //        let vc = UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: "HomeVC")
        //        vc.push()
        guard let name = nametxt.text , !name.TrimWhiteSpaces.isEmpty else {
            self.showToast(Auth_Strings.Message(.NameRequired))
            return
        }
        
        guard let email = emailtxt.text , !email.TrimWhiteSpaces.isEmpty else {
            self.showToast(Auth_Strings.Message(.EmailRequired))
            return
            
        }
        guard email.isEmailValid else {
            self.showToast(Auth_Strings.Message(.InvalidEmail))
            return
        }
        
        guard let mobileNumber = mobileNumbertxt.text , !mobileNumber.TrimWhiteSpaces.isEmpty else {
            self.showToast(Auth_Strings.Message(.mobileNumberRequired))
            return
        }
        
        guard mobileNumber.isMobileValid else {
            self.showToast(Auth_Strings.Message(.mobileNumberInvalid))
            return
            
        }
        guard let Password = passwordtxt.text, !Password.TrimWhiteSpaces.isEmpty else {
            self.showToast(Auth_Strings.Message(.PasswordRequired))
            return
        }
        
        
        self.showIndicator()
        Requests.register(email: email, password: Password) { uid in
            Auth_Verified.shared.SendEmailVerification { ErrorMessage in
                let user_obj = UserSt(UserId: uid,
                                      name: name,
                                      MobileNumber: mobileNumber,
                                      Longitude: 0,
                                      Latitude: 0,
                                      Email: email,
                                      UserImage: "")
                
                Constants.users_path.document(uid).setData(user_obj.toDic()) { error in
                    self.hideIndicator()
                    if error != nil {
                        self.showOkAlert(title: "", message: (error?.localizedDescription)!)
                        return
                    }else{
                        self.showOkAlertWithComp(title: "", message: Auth_Strings.Message(.CreateAccountSuccessfully), completion: { (action) in
                            self.pop()
                        })
                    }
                }
                
            }
        }
    }
    @IBAction func backBtn(_ sender: Any) {
        self.pop()
    }
}
