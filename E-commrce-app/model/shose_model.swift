//
//  shose_model.swift
//  E-commrce-app
//
//  Created by ezz on 18/08/2024.
//

import Foundation
import FirebaseFirestore
class Shose_model {
    var title : String?
    var shoseId : String?
    var price : String?
    var description : String
    var isPopular : Bool = false
    var isNewArrival : Bool = false
    var colors : [RadioModle]
    var isWishList : Bool = false
    var shose_brand : String
    var gender : Gender
    var images : [String]
    
    init(title: String,shoseId : String, price: String, description: String, isPopular: Bool, isNewArrival: Bool, isWishList: Bool, shose_brand : String,gender : Gender, colors : [RadioModle] ,images : [String]) {
        self.title        = title
        self.shoseId      = shoseId
        self.price        = price
        self.description  = description
        self.isPopular    = isPopular
        self.isNewArrival = isNewArrival
        self.isWishList   = isWishList
        self.colors       = colors
        self.shose_brand  = shose_brand
        self.gender       = gender
        self.images       = images
    }
    
    // Convert to dictionary for Firestore
    func toDictionary() -> [String: Any] {
        var dict: [String: Any] = [:]
        
        dict["title"]         = title
        dict["shoseId"]      = shoseId
        dict["price"]        =  price
        dict["Description"]  = description
        dict["isPopular"]    = isPopular
        dict["isNewArrival"] = isNewArrival
        dict["isWishList"]   = isWishList
        dict["shoseBrand"]   = shose_brand
        dict["Gender"]       = gender.rawValue
        dict["colors"]       = colors.map { $0.toDictionary() }
        dict["images"]       = images
        
        return dict
    }
    
    // Add an initializer that maps from a dictionary (equivalent to Firestore's DocumentSnapshot)
     init?(from dictionary: DocumentSnapshot) {
         guard let description = dictionary["Description"] as? String,
               let shoseBrand = dictionary["shoseBrand"] as? String,
               let genderRawValue = dictionary["Gender"] as? String,
               let gender = Gender(rawValue: genderRawValue),
               let colorsArray = dictionary["colors"] as? [[String: Any]],
               let images = dictionary["images"] as? [String] else {
             return nil
         }

         self.title = dictionary["title"] as? String
         self.shoseId = dictionary["shoseId"] as? String
         self.price = dictionary["price"] as? String
         self.description = description
         self.isPopular = dictionary["IsPopular"] as? Bool ?? false
         self.isNewArrival = dictionary["IsNewArrival"] as? Bool ?? false
         self.colors = colorsArray.compactMap { RadioModle(from: $0) }
         self.isWishList = dictionary["IsWishList"] as? Bool ?? false
         self.shose_brand = shoseBrand
         self.gender = gender
         self.images = images
     }
}


class Test{
    
//    
//    var EU_Array = AvalibleSizeType(from: <#[String : Any]#>, name: TypeSizeEnum.EU, values: [
//    Size_Item_model(id: "1", values: 22),
//    Size_Item_model(id: "2", values: 23),
//    Size_Item_model(id: "3", values: 24),
//    Size_Item_model(id: "4", values: 25),
//    Size_Item_model(id: "5", values: 26),
//    Size_Item_model(id: "6", values: 27),
//    Size_Item_model(id: "7", values: 28),
//
//    
//    
//    
//    ])
    
    
//    var obj = Shose_model(
//        title: "Nike",
//        price: "199$",
//        description: "Test Test Test Test Test Test Test Test Test Test Test Test Test Test",
//        isPopular: false,
//        isNewArrival: true,
//        isWishList: false,
//        colors: [
//            RadioModle(
//                id: 1,
//                name: "Red",
//                avaible_sizes_categories: [
//                    AvalibleSizeType(name: TypeSizeEnum.EU,
//                                     values: [
//                                        Size_Item_model(id: "223", values: 22),
//                                        Size_Item_model(id: "3e32", values: 23),
//                                        Size_Item_model(id: "wew", values: 43),
//                                     ]
//                                    )]),
//            
//            RadioModle(
//                id: 2,
//                name: "Green",
//                avaible_sizes_categories: [
//                    AvalibleSizeType(name: TypeSizeEnum.EU,
//                                     values: [
//                                        Size_Item_model(id: "223", values: 22),
//                                        Size_Item_model(id: "3e32", values: 23),
//                                        Size_Item_model(id: "wew", values: 43),
//                                     ]
//                                    ),
//                    
//                    AvalibleSizeType(name: TypeSizeEnum.US,
//                                     values: [
//                                        Size_Item_model(id: "232", values: 33),
//                                        Size_Item_model(id: "wqws", values: 44),
//                                        Size_Item_model(id: "dfdf", values: 55),
//                                     ]
//                                    )
//                
//                ]),
//            
//            
//            
//            
//            
//        ], shose_brand: "ADDIDS", gender: Gender.Female, images: [])
    
}
