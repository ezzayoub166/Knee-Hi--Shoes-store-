//
//  ShoeModel.swift
//  E-commrce-app
//
//  Created by ezz on 10/09/2024.
//

import Foundation


struct ShoeModel: Codable {
    let Description: String
    let Gender: String
    let colors: [Color]
    let shoseId : String
    let images: [String]
    let isNewArrival: Bool
    let isPopular: Bool
    let isWishList: Bool
    let price: String
    let shoseBrand: String
    let title: String
}

struct Color: Codable {
    let codeColor: String
    let id: Int
    let name: String
    let avaible_sizes_categories: [SizeCategory]

}

struct SizeCategory: Codable {
    let name: String
    let values: [Size]
}

struct Size: Codable {
    let id: String
    let value: Int
}
