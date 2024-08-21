//
//  Auth_Verified.swift
//  Shoes-EcommApp
//
//  Created by ezz on 13/08/2024.
//

import Foundation
import Firebase
import FirebaseAuth
class Auth_Verified {
    
    static var shared = Auth_Verified()
    
    // send email verification
    func SendEmailVerification(completion : @escaping (_ ErrorMessage : String?)-> ()){
        if let user = Auth.auth().currentUser {
            
            user.sendEmailVerification(completion: { (Error) in
                
                if let ErrorCode = Error?._code
                {
                    completion(Auth_ErrosManager.shared.TranslateError(WithErrorCode: ErrorCode))
                    return
                }
                // no errors
                completion(nil)
            })
        }
    }
    
    func IsEmailVerified() -> Bool {
        if let user = Auth.auth().currentUser {
            print("isEmailVerified = \(user.isEmailVerified)")
            return user.isEmailVerified
        } else {
            return false
        }
    }
}
