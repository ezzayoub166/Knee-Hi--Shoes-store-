//
//  Requests.swift
//  Shoes-EcommApp
//
//  Created by ezz on 13/08/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class Requests {
    
    static let window = Auth_User.topVC()
    
    
}

extension Requests {
    static func hide_indicator() {
        window?.hideIndicator()
    }
    
    static func register(email : String , password : String , completion : @escaping (String) -> Void){
        Auth.auth().createUser(withEmail: email, password: password) { auth_reslt, error in
            if error != nil {
                window?.hideIndicator()
                if let errorCode = error?._code {
                    Auth_User.ShowAlert(msg: Auth_ErrosManager.shared.TranslateError(WithErrorCode: errorCode))
                }
            }else{
                completion(auth_reslt!.user.uid)
            }
        }
    }
    
    static func login(email: String, password: String,completion: @escaping()->Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                window?.hideIndicator()
                if let errCode = error?._code {
                    Auth_User.ShowAlert(msg: Auth_ErrosManager.shared.TranslateError(WithErrorCode: errCode))
                }
            }else{
                if let id = user?.user.uid {
                    print(id)
                    if Auth_Verified.shared.IsEmailVerified() {
                        
                        Auth_User._Token = id
                        Auth_User._Password = password
                        completion()
                        window?.hideIndicator()
                        
                    }
                    else{
                        window?.hideIndicator()
                        Auth_User.ShowAlert(msg: Auth_Strings.Message(.PleaseVerifyEmail))
                    }
                }
            }
        }
        
    }
}
extension Requests {
    //MARK: - Save the Shose in Database
    static func saveShoseINDATABASE(model : Shose_model){
        Constants.dbPath.collection("shoses").addDocument(data: model.toDictionary()) { error in
            if error != nil{
                window?.hideIndicator()
                Auth_User.ShowAlert(msg: error!.localizedDescription)
            }else{
                window?.hideIndicator()
                Auth_User.ShowAlert(msg: "SUCCESS ADDED PRODUCT")
            }
            
        }
    }
    
}
