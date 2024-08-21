//
//  ItemsVC.swift
//  Shoes-EcommApp
//
//  Created by ezz on 11/08/2024.
//

import UIKit

class ItemsVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
        fetchData()

        // Do any additional setup after loading the view.
    }

    @IBAction func backBtn(_ sender: Any) {
        self.pop()
    }
}

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
    private func setUpCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(UINib(nibName: favouriteItemCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: favouriteItemCollectionViewCell.identifier)
        
    }
}

extension ItemsVC : UICollectionViewDataSource , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: favouriteItemCollectionViewCell.identifier, for: indexPath) as! favouriteItemCollectionViewCell
        return cell
    }
    
}

extension ItemsVC : UICollectionViewDelegateFlowLayout {
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
