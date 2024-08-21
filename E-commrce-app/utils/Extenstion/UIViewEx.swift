//
//  UIViewEx.swift
//  Shoes-EcommApp
//
//  Created by ezz on 07/08/2024.
//

import Foundation
import UIKit
extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
          let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
          let mask = CAShapeLayer()
          mask.path = path.cgPath
          layer.mask = mask
      }
    
        func addTopCornersShadow(shadowColor: UIColor = .black, shadowOpacity: Float = 0.5, shadowRadius: CGFloat = 5.0, shadowOffset: CGSize = CGSize(width: 0, height: 2)) {
            // Define the shadow properties
            self.layer.shadowColor = shadowColor.cgColor
            self.layer.shadowOpacity = shadowOpacity
            self.layer.shadowRadius = shadowRadius
            self.layer.shadowOffset = shadowOffset
            
            // Create a shadow path that only covers the top-left and top-right corners
            let cornerRadius: CGFloat = self.layer.cornerRadius
            let path = UIBezierPath()
            
            // Start from the bottom left corner and draw the path clockwise
            path.move(to: CGPoint(x: 0, y: bounds.height))
            path.addLine(to: CGPoint(x: 0, y: cornerRadius)) // Left side up to the top-left corner
            path.addQuadCurve(to: CGPoint(x: cornerRadius, y: 0), controlPoint: CGPoint(x: 0, y: 0)) // Top-left corner
            path.addLine(to: CGPoint(x: bounds.width - cornerRadius, y: 0)) // Top edge to top-right corner
            path.addQuadCurve(to: CGPoint(x: bounds.width, y: cornerRadius), controlPoint: CGPoint(x: bounds.width, y: 0)) // Top-right corner
            path.addLine(to: CGPoint(x: bounds.width, y: bounds.height)) // Right side down to bottom-right corner
            
            // Close the path
            path.addLine(to: CGPoint(x: 0, y: bounds.height))
            path.close()
            
            self.layer.shadowPath = path.cgPath
        }
}
