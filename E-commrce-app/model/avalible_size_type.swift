//
//  avalible_size_type.swift
//  E-commrce-app
//
//  Created by ezz on 20/08/2024.
//

import Foundation
class AvalibleSizeType  {
    
    var name : TypeSizeEnum
    var values : [Size_Item_model]
    
    init(name : TypeSizeEnum , values : [Size_Item_model]){
        self.name = name
        self.values = values
    }
    
    
    
    
    // Initializer from a dictionary (Optional)
      init?(from dictionary: [String: Any]) {
          guard let nameRawValue = dictionary["name"] as? String,
                let name = TypeSizeEnum(rawValue: nameRawValue),
                let valuesArray = dictionary["values"] as? [[String: Any]] else {
              return nil
          }

          self.name = name
          self.values = valuesArray.compactMap { Size_Item_model(from: $0) }
      }
    
    // Convert to dictionary for Firestore
     func toDictionary() -> [String: Any] {
         var dict: [String: Any] = [:]
         
         dict["name"] = name.rawValue
         dict["values"] = values.map { $0.toDictionary() }
         
         return dict
     }
}
