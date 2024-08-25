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
    var Description : String?
    var isPopular : Bool = false
    var isNewArrival : Bool = false
    var colors : [RadioModle]
    var isWishList : Bool = false
    var shose_brand : Shose_brands
    var gender : Gender
    
    init(title: String, price: String, Description: String? = nil, isPopular: Bool, isNewArrival: Bool, isWishList: Bool, colors : [RadioModle] , shose_brand : Shose_brands,gender : Gender) {
        self.title = title
        self.price = price
        self.Description = Description
        self.isPopular = isPopular
        self.isNewArrival = isNewArrival
        self.isWishList = isWishList
        self.colors = colors
        self.shose_brand = shose_brand
        self.gender = gender
    }
    
    // Convert to dictionary for Firestore
    func toDictionary() -> [String: Any] {
        var dict: [String: Any] = [:]
        
        dict["title"] = title
        dict["shoseId"] = shoseId
        dict["price"] = price
        dict["Description"] = Description
        dict["isPopular"] = isPopular
        dict["isNewArrival"] = isNewArrival
        dict["isWishList"] = isWishList
        dict["shoseBrand"] = shose_brand.rawValue
        dict["Gender"] = gender.rawValue
        dict["colors"] = colors.map { $0.toDictionary() }
        
        return dict
    }
}


class Test{
    
    
    var EU_Array = AvalibleSizeType(name: TypeSizeEnum.EU, values: [
    Size_Item_model(id: "1", values: 22),
    Size_Item_model(id: "2", values: 23),
    Size_Item_model(id: "3", values: 24),
    Size_Item_model(id: "4", values: 25),
    Size_Item_model(id: "5", values: 26),
    Size_Item_model(id: "6", values: 27),
    Size_Item_model(id: "7", values: 28),

    
    
    
    ])
    
    
    var obj = Shose_model(
        title: "Nike",
        price: "199$",
        Description: "Test Test Test Test Test Test Test Test Test Test Test Test Test Test",
        isPopular: false,
        isNewArrival: true,
        isWishList: false,
        colors: [
            RadioModle(
                id: 1,
                name: "Red",
                avaible_sizes_categories: [
                    AvalibleSizeType(name: TypeSizeEnum.EU,
                                     values: [
                                        Size_Item_model(id: "223", values: 22),
                                        Size_Item_model(id: "3e32", values: 23),
                                        Size_Item_model(id: "wew", values: 43),
                                     ]
                                    )]),
            
            RadioModle(
                id: 2,
                name: "Green",
                avaible_sizes_categories: [
                    AvalibleSizeType(name: TypeSizeEnum.EU,
                                     values: [
                                        Size_Item_model(id: "223", values: 22),
                                        Size_Item_model(id: "3e32", values: 23),
                                        Size_Item_model(id: "wew", values: 43),
                                     ]
                                    ),
                    
                    AvalibleSizeType(name: TypeSizeEnum.US,
                                     values: [
                                        Size_Item_model(id: "232", values: 33),
                                        Size_Item_model(id: "wqws", values: 44),
                                        Size_Item_model(id: "dfdf", values: 55),
                                     ]
                                    )
                
                ]),
            
            
            
            
            
        ], shose_brand: .ADDIDS, gender: Gender.Female)
    
}
