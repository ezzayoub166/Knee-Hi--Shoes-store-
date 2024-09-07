//
//  Constants.swift
//  E-commrce-app-Admin
//
//  Created by ezz on 26/08/2024.
//

import Foundation

class ConstantsAdmin {
    static let shared = ConstantsAdmin()
}
extension ConstantsAdmin {
    
    
    static let categories_arr = [
        
        Category_Item(id: 0, image_url: "icNike", title: "Nike", count: 0),
        Category_Item(id: 1, image_url: "icPuma", title: "Puma", count: 0),
        Category_Item(id: 2, image_url: "icUnderAmrong", title: "Under Armour", count: 0),
        Category_Item(id: 3, image_url: "icAddids", title: "Adidas", count: 0),
        Category_Item(id: 4, image_url: "icConvers", title: "converse", count: 0),
        
    ]
    
    static var compents : [RadioModle] = [
    RadioModle(id: 0,
               name: "Green",
               codeColor: "#008000",
               avaible_sizes_categories: [
                AvalibleSizeType(
                    name: TypeSizeEnum.EU,
                    values: [
                        Size_Item_model(id: "0", value: 44),
                        Size_Item_model(id: "1", value: 46),
                        Size_Item_model(id: "2", value: 48),
                        Size_Item_model(id: "3", value: 50),
                        Size_Item_model(id: "4", value: 52),
                        Size_Item_model(id: "5", value: 54),
                        Size_Item_model(id: "6", value: 56),
                        Size_Item_model(id: "7", value: 58),
                        Size_Item_model(id: "8", value: 60),
                        Size_Item_model(id: "9", value: 62),
                    ]
                ),
                AvalibleSizeType(
                    name: TypeSizeEnum.US,
                    values: [
                        Size_Item_model(id: "10", value: 34),
                        Size_Item_model(id: "11", value: 36),
                        Size_Item_model(id: "12", value: 38),
                        Size_Item_model(id: "13", value: 40),
                        Size_Item_model(id: "14", value: 42),
                        Size_Item_model(id: "15", value: 44),
                        Size_Item_model(id: "16", value: 46),
                        Size_Item_model(id: "17", value: 48),
                        Size_Item_model(id: "18", value: 50),
                        Size_Item_model(id: "19", value: 52),
                    ]
                ),
                AvalibleSizeType(
                    name: TypeSizeEnum.UK,
                    values: [
                        Size_Item_model(id: "20", value: 34),
                        Size_Item_model(id: "21", value: 36),
                        Size_Item_model(id: "22", value: 38),
                        Size_Item_model(id: "23", value: 40),
                        Size_Item_model(id: "24", value: 42),
                        Size_Item_model(id: "25", value: 44),
                        Size_Item_model(id: "26", value: 46),
                        Size_Item_model(id: "27", value: 48),
                        Size_Item_model(id: "28", value: 50),
                        Size_Item_model(id: "29", value: 52),
                    ]
                ),
               ]
              ),
    RadioModle(id: 2,
               name: "Red",
               codeColor: "#FF0000",
               avaible_sizes_categories: [
                AvalibleSizeType(
                    name: TypeSizeEnum.EU,
                    values: [
                        Size_Item_model(id: "0", value: 44),
                        Size_Item_model(id: "1", value: 46),
                        Size_Item_model(id: "2", value: 48),
                        Size_Item_model(id: "3", value: 50),
                        Size_Item_model(id: "4", value: 52),
                        Size_Item_model(id: "5", value: 54),
                        Size_Item_model(id: "6", value: 56),
                        Size_Item_model(id: "7", value: 58),
                        Size_Item_model(id: "8", value: 60),
                        Size_Item_model(id: "9", value: 62),
                    ]
                ),
                AvalibleSizeType(
                    name: TypeSizeEnum.US,
                    values: [
                        Size_Item_model(id: "10", value: 34),
                        Size_Item_model(id: "11", value: 36),
                        Size_Item_model(id: "12", value: 38),
                        Size_Item_model(id: "13", value: 40),
                        Size_Item_model(id: "14", value: 42),
                        Size_Item_model(id: "15", value: 44),
                        Size_Item_model(id: "16", value: 46),
                        Size_Item_model(id: "17", value: 48),
                        Size_Item_model(id: "18", value: 50),
                        Size_Item_model(id: "19", value: 52),
                    ]
                ),
                AvalibleSizeType(
                    name: TypeSizeEnum.UK,
                    values: [
                        Size_Item_model(id: "20", value: 34),
                        Size_Item_model(id: "21", value: 36),
                        Size_Item_model(id: "22", value: 38),
                        Size_Item_model(id: "23", value: 40),
                        Size_Item_model(id: "24", value: 42),
                        Size_Item_model(id: "25", value: 44),
                        Size_Item_model(id: "26", value: 46),
                        Size_Item_model(id: "27", value: 48),
                        Size_Item_model(id: "28", value: 50),
                        Size_Item_model(id: "29", value: 52),
                    ]
                ),
               ]
              ),
    RadioModle(id: 3,
               name: "Black",
               codeColor: "#000000",
               avaible_sizes_categories: [
                AvalibleSizeType(
                    name: TypeSizeEnum.EU,
                    values: [
                        Size_Item_model(id: "0", value: 44),
                        Size_Item_model(id: "1", value: 46),
                        Size_Item_model(id: "2", value: 48),
                        Size_Item_model(id: "3", value: 50),
                        Size_Item_model(id: "4", value: 52),
                        Size_Item_model(id: "5", value: 54),
                        Size_Item_model(id: "6", value: 56),
                        Size_Item_model(id: "7", value: 58),
                        Size_Item_model(id: "8", value: 60),
                        Size_Item_model(id: "9", value: 62),
                    ]
                ),
                AvalibleSizeType(
                    name: TypeSizeEnum.US,
                    values: [
                        Size_Item_model(id: "10", value: 34),
                        Size_Item_model(id: "11", value: 36),
                        Size_Item_model(id: "12", value: 38),
                        Size_Item_model(id: "13", value: 40),
                        Size_Item_model(id: "14", value: 42),
                        Size_Item_model(id: "15", value: 44),
                        Size_Item_model(id: "16", value: 46),
                        Size_Item_model(id: "17", value: 48),
                        Size_Item_model(id: "18", value: 50),
                        Size_Item_model(id: "19", value: 52),
                    ]
                ),
                AvalibleSizeType(
                    name: TypeSizeEnum.UK,
                    values: [
                        Size_Item_model(id: "20", value: 34),
                        Size_Item_model(id: "21", value: 36),
                        Size_Item_model(id: "22", value: 38),
                        Size_Item_model(id: "23", value: 40),
                        Size_Item_model(id: "24", value: 42),
                        Size_Item_model(id: "25", value: 44),
                        Size_Item_model(id: "26", value: 46),
                        Size_Item_model(id: "27", value: 48),
                        Size_Item_model(id: "28", value: 50),
                        Size_Item_model(id: "29", value: 52),
                    ]
                ),
               ]
              ),
    RadioModle(id: 4,
               name: "Blue",
               codeColor: "#0000FF",
               avaible_sizes_categories: [
                AvalibleSizeType(
                    name: TypeSizeEnum.EU,
                    values: [
                        Size_Item_model(id: "0", value: 44),
                        Size_Item_model(id: "1", value: 46),
                        Size_Item_model(id: "2", value: 48),
                        Size_Item_model(id: "3", value: 50),
                        Size_Item_model(id: "4", value: 52),
                        Size_Item_model(id: "5", value: 54),
                        Size_Item_model(id: "6", value: 56),
                        Size_Item_model(id: "7", value: 58),
                        Size_Item_model(id: "8", value: 60),
                        Size_Item_model(id: "9", value: 62),
                    ]
                ),
                AvalibleSizeType(
                    name: TypeSizeEnum.US,
                    values: [
                        Size_Item_model(id: "10", value: 34),
                        Size_Item_model(id: "11", value: 36),
                        Size_Item_model(id: "12", value: 38),
                        Size_Item_model(id: "13", value: 40),
                        Size_Item_model(id: "14", value: 42),
                        Size_Item_model(id: "15", value: 44),
                        Size_Item_model(id: "16", value: 46),
                        Size_Item_model(id: "17", value: 48),
                        Size_Item_model(id: "18", value: 50),
                        Size_Item_model(id: "19", value: 52),
                    ]
                ),
                AvalibleSizeType(
                    name: TypeSizeEnum.UK,
                    values: [
                        Size_Item_model(id: "20", value: 34),
                        Size_Item_model(id: "21", value: 36),
                        Size_Item_model(id: "22", value: 38),
                        Size_Item_model(id: "23", value: 40),
                        Size_Item_model(id: "24", value: 42),
                        Size_Item_model(id: "25", value: 44),
                        Size_Item_model(id: "26", value: 46),
                        Size_Item_model(id: "27", value: 48),
                        Size_Item_model(id: "28", value: 50),
                        Size_Item_model(id: "29", value: 52),
                    ]
                ),
               ]
              ),
    ]
}
