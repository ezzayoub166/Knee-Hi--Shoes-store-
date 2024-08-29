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
                        Size_Item_model(id: "0", values: 44),
                        Size_Item_model(id: "1", values: 46),
                        Size_Item_model(id: "2", values: 48),
                        Size_Item_model(id: "3", values: 50),
                        Size_Item_model(id: "4", values: 52),
                        Size_Item_model(id: "5", values: 54),
                        Size_Item_model(id: "6", values: 56),
                        Size_Item_model(id: "7", values: 58),
                        Size_Item_model(id: "8", values: 60),
                        Size_Item_model(id: "9", values: 62),
                    ]
                ),
                AvalibleSizeType(
                    name: TypeSizeEnum.US,
                    values: [
                        Size_Item_model(id: "10", values: 34),
                        Size_Item_model(id: "11", values: 36),
                        Size_Item_model(id: "12", values: 38),
                        Size_Item_model(id: "13", values: 40),
                        Size_Item_model(id: "14", values: 42),
                        Size_Item_model(id: "15", values: 44),
                        Size_Item_model(id: "16", values: 46),
                        Size_Item_model(id: "17", values: 48),
                        Size_Item_model(id: "18", values: 50),
                        Size_Item_model(id: "19", values: 52),
                    ]
                ),
                AvalibleSizeType(
                    name: TypeSizeEnum.UK,
                    values: [
                        Size_Item_model(id: "20", values: 34),
                        Size_Item_model(id: "21", values: 36),
                        Size_Item_model(id: "22", values: 38),
                        Size_Item_model(id: "23", values: 40),
                        Size_Item_model(id: "24", values: 42),
                        Size_Item_model(id: "25", values: 44),
                        Size_Item_model(id: "26", values: 46),
                        Size_Item_model(id: "27", values: 48),
                        Size_Item_model(id: "28", values: 50),
                        Size_Item_model(id: "29", values: 52),
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
                        Size_Item_model(id: "0", values: 44),
                        Size_Item_model(id: "1", values: 46),
                        Size_Item_model(id: "2", values: 48),
                        Size_Item_model(id: "3", values: 50),
                        Size_Item_model(id: "4", values: 52),
                        Size_Item_model(id: "5", values: 54),
                        Size_Item_model(id: "6", values: 56),
                        Size_Item_model(id: "7", values: 58),
                        Size_Item_model(id: "8", values: 60),
                        Size_Item_model(id: "9", values: 62),
                    ]
                ),
                AvalibleSizeType(
                    name: TypeSizeEnum.US,
                    values: [
                        Size_Item_model(id: "10", values: 34),
                        Size_Item_model(id: "11", values: 36),
                        Size_Item_model(id: "12", values: 38),
                        Size_Item_model(id: "13", values: 40),
                        Size_Item_model(id: "14", values: 42),
                        Size_Item_model(id: "15", values: 44),
                        Size_Item_model(id: "16", values: 46),
                        Size_Item_model(id: "17", values: 48),
                        Size_Item_model(id: "18", values: 50),
                        Size_Item_model(id: "19", values: 52),
                    ]
                ),
                AvalibleSizeType(
                    name: TypeSizeEnum.UK,
                    values: [
                        Size_Item_model(id: "20", values: 34),
                        Size_Item_model(id: "21", values: 36),
                        Size_Item_model(id: "22", values: 38),
                        Size_Item_model(id: "23", values: 40),
                        Size_Item_model(id: "24", values: 42),
                        Size_Item_model(id: "25", values: 44),
                        Size_Item_model(id: "26", values: 46),
                        Size_Item_model(id: "27", values: 48),
                        Size_Item_model(id: "28", values: 50),
                        Size_Item_model(id: "29", values: 52),
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
                        Size_Item_model(id: "0", values: 44),
                        Size_Item_model(id: "1", values: 46),
                        Size_Item_model(id: "2", values: 48),
                        Size_Item_model(id: "3", values: 50),
                        Size_Item_model(id: "4", values: 52),
                        Size_Item_model(id: "5", values: 54),
                        Size_Item_model(id: "6", values: 56),
                        Size_Item_model(id: "7", values: 58),
                        Size_Item_model(id: "8", values: 60),
                        Size_Item_model(id: "9", values: 62),
                    ]
                ),
                AvalibleSizeType(
                    name: TypeSizeEnum.US,
                    values: [
                        Size_Item_model(id: "10", values: 34),
                        Size_Item_model(id: "11", values: 36),
                        Size_Item_model(id: "12", values: 38),
                        Size_Item_model(id: "13", values: 40),
                        Size_Item_model(id: "14", values: 42),
                        Size_Item_model(id: "15", values: 44),
                        Size_Item_model(id: "16", values: 46),
                        Size_Item_model(id: "17", values: 48),
                        Size_Item_model(id: "18", values: 50),
                        Size_Item_model(id: "19", values: 52),
                    ]
                ),
                AvalibleSizeType(
                    name: TypeSizeEnum.UK,
                    values: [
                        Size_Item_model(id: "20", values: 34),
                        Size_Item_model(id: "21", values: 36),
                        Size_Item_model(id: "22", values: 38),
                        Size_Item_model(id: "23", values: 40),
                        Size_Item_model(id: "24", values: 42),
                        Size_Item_model(id: "25", values: 44),
                        Size_Item_model(id: "26", values: 46),
                        Size_Item_model(id: "27", values: 48),
                        Size_Item_model(id: "28", values: 50),
                        Size_Item_model(id: "29", values: 52),
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
                        Size_Item_model(id: "0", values: 44),
                        Size_Item_model(id: "1", values: 46),
                        Size_Item_model(id: "2", values: 48),
                        Size_Item_model(id: "3", values: 50),
                        Size_Item_model(id: "4", values: 52),
                        Size_Item_model(id: "5", values: 54),
                        Size_Item_model(id: "6", values: 56),
                        Size_Item_model(id: "7", values: 58),
                        Size_Item_model(id: "8", values: 60),
                        Size_Item_model(id: "9", values: 62),
                    ]
                ),
                AvalibleSizeType(
                    name: TypeSizeEnum.US,
                    values: [
                        Size_Item_model(id: "10", values: 34),
                        Size_Item_model(id: "11", values: 36),
                        Size_Item_model(id: "12", values: 38),
                        Size_Item_model(id: "13", values: 40),
                        Size_Item_model(id: "14", values: 42),
                        Size_Item_model(id: "15", values: 44),
                        Size_Item_model(id: "16", values: 46),
                        Size_Item_model(id: "17", values: 48),
                        Size_Item_model(id: "18", values: 50),
                        Size_Item_model(id: "19", values: 52),
                    ]
                ),
                AvalibleSizeType(
                    name: TypeSizeEnum.UK,
                    values: [
                        Size_Item_model(id: "20", values: 34),
                        Size_Item_model(id: "21", values: 36),
                        Size_Item_model(id: "22", values: 38),
                        Size_Item_model(id: "23", values: 40),
                        Size_Item_model(id: "24", values: 42),
                        Size_Item_model(id: "25", values: 44),
                        Size_Item_model(id: "26", values: 46),
                        Size_Item_model(id: "27", values: 48),
                        Size_Item_model(id: "28", values: 50),
                        Size_Item_model(id: "29", values: 52),
                    ]
                ),
               ]
              ),
    ]
}
