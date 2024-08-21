//
//  avalible_size_type.swift
//  E-commrce-app
//
//  Created by ezz on 20/08/2024.
//

import Foundation
struct AvalibleSizeType {
    var name : TypeSizeEnum
    var values : [Size_Item_model]
    
    // Convert to dictionary for Firestore
     func toDictionary() -> [String: Any] {
         var dict: [String: Any] = [:]
         
         dict["name"] = name.rawValue
         dict["values"] = values.map { $0.toDictionary() }
         
         return dict
     }
}
