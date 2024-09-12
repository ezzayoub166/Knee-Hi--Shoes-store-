//
//  shoess_service.swift
//  E-commrce-app
//
//  Created by ezz on 10/09/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ShoeService {
    private let db = Firestore.firestore()
    
    static let shared = ShoeService()
    
    let userToken = Auth_User._Token
    
    
    private var userFavoritesRef: CollectionReference {
        return db.collection("users").document(userToken).collection("favorites")
    }
    


    
    func fetchShoe(withId id: String, completion: @escaping (Result<ShoeModel, Error>) -> Void) {
        let docRef = db.collection("shoses").document(id)
        
        docRef.getDocument { (document, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let document = document, document.exists, let data = document.data() else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Document does not exist."])))
                return
            }
            
            do {
                let shoe = try Firestore.Decoder().decode(ShoeModel.self, from: data)
                completion(.success(shoe))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func fetchAllShoes(completion: @escaping (Result<[ShoeModel], Error>) -> Void) {
          db.collection("shoses").getDocuments { (querySnapshot, error) in
              if let error = error {
                  completion(.failure(error))
                  return
              }
              
              guard let documents = querySnapshot?.documents else {
                  completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No documents found."])))
                  return
              }
              
              do {
                  // Map documents to ShoeModel
                  let shoes = try documents.map { document -> ShoeModel in
                      let data = document.data()
                      return try Firestore.Decoder().decode(ShoeModel.self, from: data)
                  }
                  completion(.success(shoes))
              } catch {
                  completion(.failure(error))
              }
          }
      }
    
    func fetchDataBasedOnAttribute(completion: @escaping (Result<[ShoeModel], Error>) -> Void, attribute : String , limit : Int) {
        db.collection("shoses").whereField(attribute, isEqualTo: true).limit(to: limit).addSnapshotListener { (querySnapshot, error) in
              if let error = error {
                  completion(.failure(error))
                  return
              }
              
              guard let documents = querySnapshot?.documents else {
                  completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No documents found."])))
                  return
              }
              
              do {
                  // Map documents to ShoeModel
                  let shoes = try documents.map { document -> ShoeModel in
                      let data = document.data()
                      return try Firestore.Decoder().decode(ShoeModel.self, from: data)
                  }
                  completion(.success(shoes))
              } catch {
                  completion(.failure(error))
              }
          }
      }
    
    func addToFavorites(shoe : ShoeModel)throws{

        do{
            // Convert the ShoeModel to a dictionary using Firestore's encoder
           let shoeData = try Firestore.Encoder().encode(shoe)
            userFavoritesRef.document(shoe.shoseId).setData(shoeData)
            print("ADD TO FAVORITE SCCESSFULY......")
            
        }
        catch{
            throw NSError(domain: "FirestoreError", code: 500, userInfo: [NSLocalizedDescriptionKey: "Error adding shoe to favorites: \(error.localizedDescription)"])

        }
        
        
        
        
    }
    
    func removeFromFavorites(shoeID: String) {
        userFavoritesRef.document(shoeID).delete { error in
            if let error = error {
                print("Error removing shoe from favorites: \(error)")
            } else {
                print("Shoe removed from favorites successfully!")
            }
        }
    }

    
    
    func isShoeInFavorites(shoeID: String, completion: @escaping (Bool) -> Void) {
        userFavoritesRef.document(shoeID).getDocument { document, error in
            if let document = document, document.exists {
                completion(true) // Shoe is in favorites
            } else {
                completion(false) // Shoe is not in favorites
            }
        }
    }
    
    func getFavoritesItems(completion : @escaping (Result<[ShoeModel],Error>) -> Void){
        userFavoritesRef.addSnapshotListener { snapshot, error in
            if let error = error {
                completion(.failure(error))
                return
            }else {
                guard let documents = snapshot?.documents else {
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No documents found."])))
                    return
                }
                
                do {
                    // Map documents to ShoeModel
                    let shoes = try documents.map { document -> ShoeModel in
                        let data = document.data()
                        return try Firestore.Decoder().decode(ShoeModel.self, from: data)
                    }
                    completion(.success(shoes))
                } catch {
                    completion(.failure(error))
                }
                
            }
        }
        
    }

}
