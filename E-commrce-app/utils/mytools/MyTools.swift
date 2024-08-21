//
//  MyTools.swift
//  Shoes-EcommApp
//
//  Created by ezz on 13/08/2024.
//

import UIKit
import Foundation
import AVFoundation
import AVKit

class MyTools: NSObject {
    
    static func appFont(name: e_font_type = .Regular, size: CGFloat = 16) -> UIFont {
        let font = UIFont.init(name: name.rawValue, size: size)
        return font ?? UIFont.systemFont(ofSize: 16)
    }
    
    static func printAllFont() {
        for familyName in UIFont.familyNames {
            for fontName in UIFont.fontNames(forFamilyName: familyName ) {
                print("\(familyName) : \(fontName)")
            }
        }
    }

    static func randomString(length: Int) -> String {
        
        let letters : NSString = "0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
    
    static func AgeArray() -> [String] {
        return Array(18...50).map{ "\($0)" }
    }

    static func GenderArray() -> [String] {
        return ["Male", "Female"]
    }

    static func MaritalArray() -> [String] {
        return ["Married", "Single", "Divorced", "Widowed"]
    }

    static func imageWithGradient(startColor:UIColor, endColor:UIColor, size:CGSize, horizontally:Bool = true) -> UIImage? {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        if horizontally {
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        } else {
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        }
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    static func GetDateAgo(dt_date : Int) -> String {
        let _date = Date(milliseconds: dt_date)
        let retdate = DateFormatter().timeSince(from: _date, numericDates: true)
        return retdate
    }

    static func AlertSheet(vc: UIViewController,title : String = "",options: [String],showCancel: Bool = true, completion: @escaping(Int,String,Bool)->Void) {
        
        let actionSheet: UIAlertController = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        
        for (index, option) in options.enumerated() {
            let btn_Action = UIAlertAction(title: option, style: .default) { _ in
                completion(index, option, false)
            }
            actionSheet.addAction(btn_Action)
        }
        
        if showCancel {
            let btn_Cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
                completion(-1,"",true)
            }
            btn_Cancel.setValue(UIColor.red, forKey: "titleTextColor")
            actionSheet.addAction(btn_Cancel)
        }
        
        if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad) {
            if let popoverController = actionSheet.popoverPresentationController {
                popoverController.sourceRect = vc.view.bounds//sender.bounds
                popoverController.sourceView = vc.view//sender
                popoverController.permittedArrowDirections = .any
            }
        }
        
        vc.presentVC(actionSheet)
    }
    
//    static func StartSchedualeNotifi() {
//        let content = UNMutableNotificationContent()
//        content.title = "Hello"
//        content.body = "Please buy the things dude"
//        content.sound = .default
//
//        var dateComponents = DateComponents()
//        dateComponents.calendar = Calendar.current
//        dateComponents.hour = 12
//        // Create the trigger as a repeating event.
//
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
//
//        let uuidString = UUID().uuidString
//        let request = UNNotificationRequest(identifier: uuidString,content: content, trigger: trigger)
//
//        // Schedule the request with the system.
//        let notificationCenter = UNUserNotificationCenter.current()
//        notificationCenter.add(request) { (error) in
//           if error != nil {
//              // Handle any errors.
//           }
//        }
//    }
    
    static func StopSchedualeNotifi() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    
//    static func calculateDistance(_ lat:Double,_ lon:Double,_ lat2:Double,_ lon2:Double) -> Double {
//        let coordinate = CLLocation(latitude: lat, longitude: lon)
//        let coordinater = CLLocation(latitude: lat2, longitude: lon2)
//        let distanceIn = coordinate.distance(from: coordinater)
//        let distance = Double(distanceIn/1000).rounded(toPlaces: 2)
//        return distance
//    }


}

extension DateFormatter {
    func timeSince(from: Date, numericDates: Bool = false) -> String {
        let calendar = Calendar.current
        let now = NSDate()
        let earliest = now.earlierDate(from as Date)
        let latest = earliest == now as Date ? from : now as Date
        let components = calendar.dateComponents([.year, .weekOfYear, .month, .day, .hour, .minute, .second], from: earliest, to: latest as Date)
        
        var result = ""
        
        if components.year! >= 2 {
            result = "\(components.year!) years ago"
            
        } else if components.year! >= 1 {
            result = "year ago"
            
        } else if components.month! >= 2 {
            result = "\(components.month!) months ago"
            
        } else if components.month! >= 1 {
            result = "month ago"
            
        } else if components.weekOfYear! >= 2 {
            result = "\(components.weekOfYear!) weeks"
            
        } else if components.weekOfYear! >= 1 {
            result = "week ago"
            
        } else if components.day! >= 2 {
            result = "\(components.day!) days"
            
        } else if components.day! >= 1 {
            result = "day ago"
            
        } else if components.hour! >= 2 {
            result = "\(components.hour!) hrs"
            
        } else if components.hour! >= 1 {
            result = "1 hr"
            
        } else if components.minute! >= 2 {
            result = "\(components.minute!) mins"
            
        } else if components.minute! >= 1 {
            result = "1 min"
            
        } else if components.second! >= 3 {
            result = "\(components.second!) sec"
        } else {
            result = "now"
        }
        
        return result
    }
}
