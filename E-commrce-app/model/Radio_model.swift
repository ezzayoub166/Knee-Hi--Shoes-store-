//
//  Radio_model.swift
//  E-commrce-app
//
//  Created by ezz on 20/08/2024.
//

import Foundation
class RadioModle   {
    
    var id : Int
    var name : String
    var codeColor : String?
    var avaible_sizes_categories : [AvalibleSizeType]
    
    
    init(id : Int , name : String , codeColor : String , avaible_sizes_categories: [AvalibleSizeType]) {

        self.id = id
        self.name = name
        self.codeColor = codeColor
        self.avaible_sizes_categories = avaible_sizes_categories
    }
    
    // Convert to dictionary for Firestore
     func toDictionary() -> [String: Any] {
         var dict: [String: Any] = [:]
         
         dict["id"] = id
         dict["name"] = name
         dict["codeColor"] = codeColor
         dict["avaible_sizes_categories"] = avaible_sizes_categories.map { $0.toDictionary() }
         
         return dict
     }
    
    // Initializer from a dictionary (Optional)
        init?(from dictionary: [String: Any]) {
            guard let id = dictionary["id"] as? Int,
                  let name = dictionary["name"] as? String,
                  let availableSizesCategoriesArray = dictionary["avaible_sizes_categories"] as? [[String: Any]] else {
                return nil
            }

            self.id = id
            self.name = name
            self.codeColor = dictionary["codeColor"] as? String
            self.avaible_sizes_categories = availableSizesCategoriesArray.compactMap { AvalibleSizeType(from: $0) }
        }
}
