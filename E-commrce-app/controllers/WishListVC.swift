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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupview()
        setupdata()
        fetchData()
        
    }
    
    
}

extension WishListVC {
    private func setupview(){
        isHiddenNavigation = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        customNav.backgroundColor = .clear
        collectionView.register(UINib(nibName: favouriteItemCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: favouriteItemCollectionViewCell.identifier)
        
    }
    private func setupdata(){
        
    }
    private func fetchData(){
        
    }
}

extension WishListVC : UICollectionViewDataSource , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: favouriteItemCollectionViewCell.identifier, for: indexPath) as! favouriteItemCollectionViewCell
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
