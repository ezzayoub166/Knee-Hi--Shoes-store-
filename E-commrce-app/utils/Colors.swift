//
//  Colors.swift
//  E-commrce-app
//
//  Created by ezz on 16/08/2024.
//

import Foundation

import UIKit.UIColor

let color_517FF6 = "517FF6".color_
let color_F0F4FB = "F0F4FB".color_
let color_515151 = "515151".color_
let color_989DB3 = "989DB3".color_

extension UIColor {
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
