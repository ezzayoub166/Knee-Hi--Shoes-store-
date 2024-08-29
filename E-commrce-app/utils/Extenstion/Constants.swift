//
//  Constants.swift
//  Shoes-EcommApp
//
//  Created by ezz on 14/08/2024.
//

import Foundation
import FirebaseStorage
import FirebaseFirestore

struct Constants {
    static let dbPath           =  Firestore.firestore()
    static let storagePath      = Storage.storage().reference()
    
    static let users_path        = dbPath.collection("users")
    static let storage_images    = storagePath.child("images")
    
    static let categories_arr = [
        
        Category_Item(id: 0, image_url: "icNike", title: "Nike", count: 0),
        Category_Item(id: 1, image_url: "icPuma", title: "Puma", count: 0),
        Category_Item(id: 2, image_url: "icUnderAmrong", title: "Under Armour", count: 0),
        Category_Item(id: 3, image_url: "icAddids", title: "Adidas", count: 0),
        Category_Item(id: 4, image_url: "icConvers", title: "converse", count: 0),
        
    ]
    
    
    
}


//It basically just gets image from assets, saves its data to disk and return file URL.
class AssetExtractor {
    
    static func createLocalUrl(forImageNamed name: String) -> URL? {
        
        let fileManager = FileManager.default
        let cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        let url = cacheDirectory.appendingPathComponent("\(name).png")
        
        guard fileManager.fileExists(atPath: url.path) else {
            guard
                let image = UIImage(named: name),
                let data = image.pngData()
            else { return nil }
            
            fileManager.createFile(atPath: url.path, contents: data, attributes: nil)
            return url
        }
        
        return url
    }
    
}


class ConstantsFunctions{
    static func uploadCategoryData() async {
        for category in Constants.categories_arr {
            do {
                
                //                var file =  try await EStorageManager.shared.getImageDataFromAssets(from: category.image_url ?? "")
                //                var downloadUrl = try await EStorageManager.shared.uploadImageData(from: "Categories", data: file, name: category.title ?? "")
                let imageData = try getImageDataFromAssets(from: category.image_url ?? "")
                let downloadUrl = try await EStorageManager.shared.uploadImageData(from: "Categories", data: imageData, name: category.title ?? "")
                category.image_url = downloadUrl
                Constants.dbPath.collection("Categories").addDocument(data: category.toJson()) { error in
                    if error != nil{
                        print("FAluire the upload ")
                    }else{
                        print("======================upload Categories Donde")
                    }
                }
            }catch{
                print("Error uploading category \(category.title!): \(error)")
                
            }
        }
    }
    static func getImageDataFromAssets(from path: String) throws -> Data {
        guard let image = UIImage(named: path),
              let imageData = image.pngData() else {
            throw EStorageManagerError.assetNotFound("Unable to load image data from path \(path)")
        }
        return imageData
    }
}
