//
//  User_obj.swift
//  Shoes-EcommApp
//
//  Created by ezz on 14/08/2024.
//
import FirebaseFirestore

import Foundation
class UserSt {

    var UserId        : String = ""
    var name          : String = ""
    var Longitude     : Double = 0
    var Latitude      : Double = 0
    var Email         : String = ""
    var MobileNumber   : String = ""
    var UserImage     : String = ""

    init(_ snapshot: DocumentSnapshot) {
        let obj = snapshot.data() ?? [:]

        self.UserId        = obj["UserId"] as? String ?? ""
        self.name          = obj["Name"] as? String ?? ""
        self.Longitude     = obj["Longitude"] as? Double ?? 0
        self.Latitude      = obj["Latitude"] as? Double ?? 0
        self.Email         = obj["Email"] as? String ?? ""
        self.UserImage     = obj["UserImage"] as? String ?? ""
        self.MobileNumber     = obj["MobileNumber"] as? String ?? ""
    }
    
    init( UserId: String,
          name: String,
          MobileNumber : String,
          Longitude: Double,
          Latitude: Double,
          Email: String,
          UserImage: String){
        self.UserId = UserId
        self.name = name
        self.Email = Email
        self.Latitude = Latitude
        self.Longitude = Longitude
        self.UserImage = UserImage
        self.MobileNumber  = MobileNumber
    }
    
    func toDic() -> [String:Any] {
        return [ "UserId"        : self.UserId,
                 "Name"      :     self.name,
                 "MobileNumber" : self.MobileNumber,
                 "Longitude"     : self.Longitude,
                 "Latitude"      : self.Latitude,
                 "Email"         : self.Email,
                 "UserImage"     : self.UserImage,]
    }
    
}
