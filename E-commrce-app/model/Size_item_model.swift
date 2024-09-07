//
//  Size_item_model.swift
//  E-commrce-app
//
//  Created by ezz on 20/08/2024.
//

import Foundation

class Size_Item_model  {
    
    var id : String
    var value : Int
    var isChecked : Bool? = false
    
    
    init(id: String, value: Int , isChecked : Bool = false) {
        self.id = id
        self.value = value
        self.isChecked = isChecked
    }
    
    
    // Initializer from dictionary (Optional)
    convenience init?(from dictionary: [String: Any]) {
        guard let id = dictionary["id"] as? String,
              let value = dictionary["value"] as? Int,
              let isChecked = dictionary["isChecked"] as? Bool else {
            return nil
        }

        self.init(id: id, value: value, isChecked: isChecked)
    }
    
    // Convert to dictionary for Firestore
      func toDictionary() -> [String: Any] {
          var dict: [String: Any] = [:]
          
          dict["id"] = id
          dict["value"] = value
          dict["isChecked"] = isChecked
          
          return dict
      }
    
    
}
