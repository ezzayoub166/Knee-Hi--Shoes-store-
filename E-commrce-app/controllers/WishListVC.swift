//
//  WishListVC.swift
//  Shoes-EcommApp
//
//  Created by ezz on 08/08/2024.
//

import UIKit

class WishListVC: UIViewController {
    
    
    @IBOutlet weak var customNav: CustomNavigationBarViewController!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var arrayOfShoeses : [ShoeModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupview()
        setupdata()
        fetchData()
        
    }
    
    
}

//MARK: - Main Functions for WishList View Controller

extension WishListVC {
    private func setupview(){
        setupNav()
        setUpCollectionView()
    
    
    }
    private func setupdata(){
        
    }
    private func fetchData(){
        getFavorites()
        
    }
}

//MARK: - other Functions...
extension WishListVC {
    private func setupNav(){
        isHiddenNavigation = true
        customNav.backgroundColor = .clear
        
    }
    private func setUpCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.register(UINib(nibName: favouriteItemCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: favouriteItemCollectionViewCell.identifier)
        
    }
    
    private func getFavorites() {
        // Dispatch to a background thread for data fetching
        DispatchQueue.global(qos: .background).async {
            ShoeService.shared.getFavoritesItems { result in
                switch result {
                case .success(let shoeses):
                    self.arrayOfShoeses = shoeses
                    
                    // Dispatch back to the main thread to update the UI
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    
                case .failure(let error):
                    print("Failed to fetch favorites: \(error.localizedDescription)")
                    
                    // Handle UI updates on the main thread in case of failure as well
                    DispatchQueue.main.async {
                        // You might want to show an error message on the UI here
                        // For example, display a message or stop a loading spinner
                    }
                }
            }
        }
    }

    
    @objc private func removeItem(_ sender:UIButton){
        let shoe = arrayOfShoeses[sender.tag]
        sender.isSelected.toggle()
        ShoeService.shared.removeFromFavorites(shoeID: shoe.shoseId)
        DispatchQueue.main.async {
            self.arrayOfShoeses.remove(at: sender.tag)
            self.collectionView.reloadData()
        }

        
        
        
    }
    
}

extension WishListVC : UICollectionViewDataSource , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfShoeses.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : favouriteItemCollectionViewCell = collectionView.dequeueCVCell(indexPath: indexPath)
        var shoe = arrayOfShoeses[indexPath.row]
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
        cell.favBtn.addTarget(self, action: #selector(removeItem(_:)), for: .touchUpInside)
        cell.favBtn.tag = indexPath.row
        return cell
    }
    
}

extension WishListVC : UICollectionViewDelegateFlowLayout {
    // MARK: - UICollectionViewDelegateFlowLayout

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
