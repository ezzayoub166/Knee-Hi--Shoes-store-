//
//  category_item.swift
//  E-commrce-app
//
//  Created by ezz on 17/08/2024.
//

import Foundation
import FirebaseFirestore
class Category_Item{
    var id : Int?
    var image_url : String?
    var title : String?
    var count : Int = 0
    
    
    init(id: Int?, image_url: String? = nil, title: String, count: Int) {
        self.id = id
        self.image_url = image_url
        self.title = title
        self.count = count
    }
    
    
    static func empty() -> Category_Item {
        return Category_Item(id: nil, image_url: "", title: "", count: 0)
    }
    
    func toJson() -> [String:Any]{
        return [
            "id":self.id as Any,
            "ImageUrl" : self.image_url as Any,
            "count":self.count as Any,
            "title":self.title as Any
        ]
    }
    
    init(from document : DocumentSnapshot){
        let data = document.data() ?? [:]
        self.id =  data["id"] as? Int
        self.image_url = data["ImageUrl"] as? String
        self.count = data["count"] as? Int ?? 0
        self.title = data["title"] as? String
        
        
    }
    
    
    
    
    
    
}
