//
//  Radio_model.swift
//  E-commrce-app
//
//  Created by ezz on 20/08/2024.
//

import Foundation
struct RadioModle {
    var id : Int
    var name : String
    var codeColor : String?
    var avaible_sizes_categories : [AvalibleSizeType]
    
    // Convert to dictionary for Firestore
     func toDictionary() -> [String: Any] {
         var dict: [String: Any] = [:]
         
         dict["id"] = id
         dict["name"] = name
         dict["codeColor"] = codeColor
         dict["avaible_sizes_categories"] = avaible_sizes_categories.map { $0.toDictionary() }
         
         return dict
     }
}
