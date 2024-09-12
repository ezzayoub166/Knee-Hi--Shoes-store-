//
//  ItemsVC.swift
//  Shoes-EcommApp
//
//  Created by ezz on 11/08/2024.
//

import UIKit


class ItemsVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var arry_of_shoses : [ShoeModel] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
        fetchData()
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    @IBAction func backBtn(_ sender: Any) {
        self.pop()
    }
}

//MARK: - Main Functions in View Controller...
extension ItemsVC {
    private func setupView(){
        setUpCollectionView()
    }
    private func setupData(){
        
    }
    private func fetchData(){
        
    }
    private func localized(){
        
    }
}

//MARK: - for the other Fucntions ..
extension ItemsVC {
    
    private func setUpCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(UINib(nibName: favouriteItemCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: favouriteItemCollectionViewCell.identifier)
        
    }
    
    
//    @objc func favoriteButtonTapped(_ sender: UIButton) {
//        let buttonPosition = sender.convert(CGPoint.zero, to: collectionView)
//        if let indexPath = collectionView.indexPathForItem(at: buttonPosition) {
//            let shoe = arry_of_shoses[indexPath.row]
//            
////            if sender.isSelected {
////                ShoeService.shared.removeFromFavorites(shoeID: shoe.shoseId)
////            } else {
////                try? ShoeService.shared.addToFavorites(shoe: shoe)
////            }
//            
//            // Update the appearance based on the new isSelected state
//             if sender.isSelected {
//                 sender.tintColor = UIColor.red
//                 sender.setImage(UIImage(named: "favorite_filled_icon"), for: .normal)
//                 // Add the shoe to favorites
//                 try? ShoeService.shared.addToFavorites(shoe: shoe)
//             } else {
//                 sender.tintColor = UIColor.gray
//                 sender.setImage(UIImage(named: "favorite_outline_icon"), for: .normal)
//                 // Remove the shoe from favorites
//                 ShoeService.shared.removeFromFavorites(shoeID: shoe.shoseId)
//             }
//            
//            sender.isSelected = !sender.isSelected
//        }
//    }
    
    @objc func favoriteButtonTapped(_ sender: UIButton) {
        let shoe = arry_of_shoses[sender.tag]
        
        sender.isSelected.toggle()
        if sender.isSelected {
            // Shoe added to favorites
            sender.tintColor = UIColor.red
            sender.setImage(UIImage(named: "favorite_filled_icon"), for: .normal)
            try? ShoeService.shared.addToFavorites(shoe: shoe)
        } else {
            // Shoe removed from favorites
            sender.tintColor = UIColor.gray
            sender.setImage(UIImage(named: "favorite_outline_icon"), for: .normal)
            ShoeService.shared.removeFromFavorites(shoeID: shoe.shoseId)
        }
    }

    
}

extension ItemsVC : UICollectionViewDataSource , UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arry_of_shoses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let shoe = arry_of_shoses[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: favouriteItemCollectionViewCell.identifier, for: indexPath) as! favouriteItemCollectionViewCell
        
        // Configure the shoe in the cell
        cell.configure(model: shoe)
        
        // Check if the shoe is already in favorites
        ShoeService.shared.isShoeInFavorites(shoeID: shoe.shoseId) { isFavorite in
            cell.favBtn.isSelected = isFavorite
            if isFavorite {
                cell.favBtn.tintColor = UIColor.red
                cell.favBtn.setImage(UIImage(named: "favorite_filled_icon"), for: .normal)
            } else {
                cell.favBtn.tintColor = UIColor.gray
                cell.favBtn.setImage(UIImage(named: "favorite_outline_icon"), for: .normal)
            }
        }
        
        // Add action for when the favorite button is tapped
        cell.favBtn.addTarget(self, action: #selector(favoriteButtonTapped(_:)), for: .touchUpInside)
        cell.favBtn.tag = indexPath.row
        
        return cell
    }

    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: favouriteItemCollectionViewCell.identifier, for: indexPath) as! favouriteItemCollectionViewCell
//        var  shoe = arry_of_shoses[indexPath.row]
//        ShoeService.shared.isShoeInFavorites(shoeID: shoe.shoseId) { isFavorite in
//               cell.favBtn.isSelected = isFavorite // Update UI accordingly
//                
//           }
//           
//        cell.favBtn.addTarget(self, action: #selector(favoriteButtonTapped(_:)), for: .touchUpInside)
//        cell.configure(model: shoe)
//        return cell
//    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout


extension ItemsVC : UICollectionViewDelegateFlowLayout {

     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let padding: CGFloat = 20 // 10 points for each side
         let collectionViewSize = collectionView.frame.size.width - padding

         return CGSize(width: collectionViewSize/2, height:200)
     }

     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
         return 10
     }

     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         return 10
     }
}
