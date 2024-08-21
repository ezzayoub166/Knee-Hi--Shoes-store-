//
//  DateEx.swift
//  ReviosnIOSTotourial
//
//  Created by ezz on 21/07/2024.
//

import Foundation
import UIKit
//MARK: - we need to convert from date to String and we need to deal data Formater
//
extension Date {
    var stringDate : String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar.init(identifier: .gregorian)
        formatter.dateFormat = "yyyy-MM-dd" //2021-03-12
        return formatter.string(from: self)
    }
    
    func string(dateFormatter : String ,timeZone : String = TimeZone.current.identifier) -> String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar.init(identifier: .gregorian)
        formatter.dateFormat = dateFormatter //2021-03-12
        formatter.timeZone = TimeZone.init(identifier: timeZone)
        return formatter.string(from: self)
    }
    var millisecondsSince1970:Int {
        return Int((self.timeIntervalSince1970 * 1000.0))
    }
    
    init(milliseconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
    }

    func toMillis() -> Int! {
        return Int(self.timeIntervalSince1970 * 1000)
    }

    func dateToString(_ format: String = "yyyy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    var nextDay : Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
    
    var previousDay:Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }

    var previousYear:Date {
        return Calendar.current.date(byAdding: .year, value: -18, to: self)!
    }
}
