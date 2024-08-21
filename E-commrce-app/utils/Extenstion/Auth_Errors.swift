//
//  Auth_Errors.swift
//  Shoes-EcommApp
//
//  Created by ezz on 13/08/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class Auth_ErrosManager {
    
    static var shared = Auth_ErrosManager()
    
    func TranslateError(WithErrorCode code: Int) -> String {
        // Attempt to initialize AuthErrorCode.Code with the raw value, defaulting to .none if not possible
        let authErrorCode = AuthErrorCode(rawValue: code ) ?? .none
        
        switch authErrorCode {
        case .invalidEmail:
            return Auth_Strings.Message(.InvalidEmail)
        case .emailAlreadyInUse:
            return Auth_Strings.Message(.EmailAlreadyInUse)
        case .networkError:
            return Auth_Strings.Message(.NoInternetConnection)
        case .weakPassword:
            return Auth_Strings.Message(.WeakPassword)
        case .userNotFound:
            return Auth_Strings.Message(.UserNotFound)
        case .wrongPassword:
            return Auth_Strings.Message(.WrongPassword)
        case .requiresRecentLogin:
            return Auth_Strings.Message(.RequiresRecentLogin)
        default:
            return Auth_Strings.Message(.UnKnownProblem)
        }
        
        
        
    }
}
