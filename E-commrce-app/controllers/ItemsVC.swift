//
//  ItemsVC.swift
//  Shoes-EcommApp
//
//  Created by ezz on 11/08/2024.
//

import UIKit


class ItemsVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var arry_of_shoses : [Shose_model] = []
    
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

extension ItemsVC {
    private func setupView(){
        setUpCollectionView()
    }
    private func setupData(){
        
    }
    private func fetchData(){
        fetchPopularProducts()
        
    }
    private func localized(){
        
    }
    private func setUpCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(UINib(nibName: favouriteItemCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: favouriteItemCollectionViewCell.identifier)
        
    }
    
    private func fetchPopularProducts(){
        self.arry_of_shoses.removeAll()
//        self.popular_indictor.startAnimating()
        Requests.getProducts(completion: { result in
            switch result {
            case .success(let shoses):
                self.arry_of_shoses = shoses

                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let failure):
                print(failure.localizedDescription)
        
            }
        }, attribute: "isPopular", limit: 100)
        
    }
}

extension ItemsVC : UICollectionViewDataSource , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arry_of_shoses.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: favouriteItemCollectionViewCell.identifier, for: indexPath) as! favouriteItemCollectionViewCell
        let obj = arry_of_shoses[indexPath.row]
        print(obj.colors.map{print($0.name)})
        cell.configure(model: arry_of_shoses[indexPath.row])
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
