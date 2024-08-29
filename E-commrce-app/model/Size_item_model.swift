//
//  Size_item_model.swift
//  E-commrce-app
//
//  Created by ezz on 20/08/2024.
//

import Foundation

class Size_Item_model  {
    static func == (lhs: Size_Item_model, rhs: Size_Item_model) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    var id : String
    var values : Int
    var isChecked : Bool? = false
    
    
    init(id: String, values: Int , isChecked : Bool = false) {
        self.id = id
        self.values = values
        self.isChecked = isChecked
    }
    
    
    // Initializer from dictionary (Optional)
    convenience init?(from dictionary: [String: Any]) {
        guard let id = dictionary["id"] as? String,
              let values = dictionary["values"] as? Int,
              let isChecked = dictionary["isChecked"] as? Bool else {
            return nil
        }

        self.init(id: id, values: values, isChecked: isChecked)
    }
    
    // Convert to dictionary for Firestore
      func toDictionary() -> [String: Any] {
          var dict: [String: Any] = [:]
          
          dict["id"] = id
          dict["values"] = values
          
          return dict
      }
    
    
}
