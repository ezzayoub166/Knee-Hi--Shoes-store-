//
//  Size_item_model.swift
//  E-commrce-app
//
//  Created by ezz on 20/08/2024.
//

import Foundation
class Size_Item_model {
    var id : String
    var values : Int
    
    
    init(id: String, values: Int) {
        self.id = id
        self.values = values
    }
    
    // Convert to dictionary for Firestore
      func toDictionary() -> [String: Any] {
          var dict: [String: Any] = [:]
          
          dict["id"] = id
          dict["values"] = values
          
          return dict
      }
}
