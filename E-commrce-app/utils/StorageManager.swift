//
//  StorageManager.swift
//  E-commrce-app
//
//  Created by ezz on 17/08/2024.
//

import Foundation
import FirebaseStorage

enum EStorageManagerError: Error {
    case assetNotFound(String)
}


class EStorageManager {
    
    static var shared = EStorageManager()
    private let storage = Storage.storage()

     // Function to download image data from assets
     func getImageDataFromAssets(from path: String) async throws -> Data {
         guard let assetPath = Bundle.main.path(forResource: path, ofType: "jpg"),
               let imageData = try? Data(contentsOf: URL(fileURLWithPath: assetPath)) else {
             throw EStorageManagerError.assetNotFound(path)
         }
         return imageData
     }
    
    // Function to upload image data to Firebase Storage
    func uploadImageData(from folder: String, data: Data, name: String) async throws -> String {
        let storageRef = storage.reference().child("\(folder)/\(name).jpg")
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"

        _ = try await storageRef.putDataAsync(data, metadata: metadata)
        let downloadURL = try await storageRef.downloadURL()
        return downloadURL.absoluteString
    }
}
