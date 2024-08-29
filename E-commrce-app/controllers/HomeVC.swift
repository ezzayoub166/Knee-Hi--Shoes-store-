//
//  HomeVC.swift
//  Shoes-EcommApp
//
//  Created by ezz on 05/08/2024.
//

import UIKit

class HomeVC: UIViewController {
    
    
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    @IBOutlet weak var popularShoesCollectionView: CollectionViewAdjusetHeight!
    
    @IBOutlet weak var newArrivalsCollectionView: UICollectionView!
    
    
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.showsVerticalScrollIndicator = false
            scrollView.showsHorizontalScrollIndicator = false
        }
    }
    
    @IBOutlet weak var category_indictor: UIActivityIndicatorView!
    
    
    @IBOutlet weak var popular_indictor: UIActivityIndicatorView!
    
    
    var selectedIndexPath: IndexPath? = IndexPath(row: 0, section: 0){
        didSet{
            DispatchQueue.main.async {
                self.categoriesCollectionView.reloadData()
            }
        }
    }
    
    var isSelected : Int = 0 {
        didSet{
            categoriesCollectionView.reloadData()
        }
        
    }
    
    
    
    var category_array : [Category_Item] = []
    
    var popular_shoses : [Shose_model] = []
    var new_arrival_shoses : [Shose_model] = []
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        isHiddenNavigation = true
        setupView()
        setupData()
        fetchData()
        
        Constants.dbPath.collection("shoses").whereField("isPopular", isEqualTo:true).limit(to: 4).getDocuments { snapshot, error in
            if error != nil {
                print("Error getting documents: \(String(describing: error?.localizedDescription))")

                return
            }
            guard let documents = snapshot?.documents else {
                return
            }
            
            let shoses : [Shose_model] = documents.compactMap { doc in
                return Shose_model.init(from: doc)
            }
            
            print(shoses)
            
            
        }
       
        // Usage
//        Requests.getProducts { result in
//                switch result {
//                case .success(let shosesIsPopular):
//                    print(shosesIsPopular)
//                    // Perform additional background tasks if needed
//                    
//                    // If you need to update the UI:
//                    DispatchQueue.main.async {
//                        // Update UI here
//                    }
//                case .failure(let error):
//                    print("Failed to fetch products: \(error)")
//                }
//        }

//        Task{
//            await ConstantsFunctions.uploadCategoryData()
//        }

        
    }

    @IBAction func seeAllPopular(_ sender: Any) {
        let vc = UIStoryboard.mainStoryBoard.instantiateViewController(identifier: "ItemsVC")
        vc.push()
    }
    
    
    
    
    
    
    
}
extension HomeVC {
    func setupView(){
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.showsHorizontalScrollIndicator = false
        
        popularShoesCollectionView.dataSource = self
        popularShoesCollectionView.delegate = self
        popularShoesCollectionView.showsVerticalScrollIndicator = false
        
        newArrivalsCollectionView.delegate  = self
        newArrivalsCollectionView.dataSource = self
        newArrivalsCollectionView.showsHorizontalScrollIndicator = false
        
        newArrivalsCollectionView.isScrollEnabled = true
        popularShoesCollectionView.isScrollEnabled = false
        
        
//        categoriesCollectionView.register(UINib(nibName: CategoriesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoriesCollectionViewCell.identifier)
        
        categoriesCollectionView.register(UINib(nibName: selectedCategoriesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: selectedCategoriesCollectionViewCell.identifier)
        
        popularShoesCollectionView.register(UINib(nibName: productItemCollectionViewCell.identifier, bundle: nil),forCellWithReuseIdentifier: productItemCollectionViewCell.identifier)
        
        newArrivalsCollectionView.register(UINib(nibName: newArrivalCollectionViewCell.identifier, bundle: nil),forCellWithReuseIdentifier: newArrivalCollectionViewCell.identifier)
        
        
        
    }
    func setupData(){
        
    }
    func fetchData(){
        getCategories()
        fetchPopularProducts()
        
    }
    
    
    private func getCategories(){
        category_array.removeAll()
        self.category_indictor.startAnimating()
        Constants.dbPath.collection("Categories").getDocuments { snapshot, error in
            switch snapshot {
            case .some(_):
                snapshot?.documents.forEach({ snapshot in
                    let dict = snapshot.data()
                    let title = dict["title"] as? String ?? ""
                    let image = dict["ImageUrl"] as? String
                    let id = dict["id"] as? Int
                    let count = dict["count"] as? Int ?? 0
                    self.category_array.append(Category_Item(id: id, image_url: image, title: title, count: count))
                    DispatchQueue.main.async {
                        self.categoriesCollectionView.reloadData()
                        self.category_indictor.stopAnimating()
                        self.category_indictor.hidesWhenStopped = true
                    }
                 

                    
                })
            case .none:
                self.category_indictor.stopAnimating()
                break
                
            }
        }
        
    }
    
    private func fetchPopularProducts(){
        self.popular_shoses.removeAll()
        self.popular_indictor.startAnimating()
        Requests.getProducts(completion: { result in
            switch result {
            case .success(let shoses):
                self.popular_shoses = shoses
                print(shoses[0].images[0])
                DispatchQueue.main.async {
                    self.popularShoesCollectionView.reloadData()
                    self.popular_indictor.stopAnimating()
                    self.popular_indictor.hidesWhenStopped = true
                }
            case .failure(let failure):
                print(failure.localizedDescription)
        
            }
        }, attribute: "isPopular")
        
    }
}
extension HomeVC : UICollectionViewDataSource , UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoriesCollectionView {
            return category_array.count
        }else if collectionView == popularShoesCollectionView  {
            return popular_shoses.count
        } else {
            return 5
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == categoriesCollectionView{
            //            if self.isSelected == indexPath.row {
            
            let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: selectedCategoriesCollectionViewCell.identifier, for: indexPath) as! selectedCategoriesCollectionViewCell
            let isSelected = indexPath == selectedIndexPath
            cell.configure(model: category_array[indexPath.row])
            let greyWithOpacity = UIColor(white: 0.3, alpha: 0.2) // 50% grey with 50% opacity

            if isSelected {
                cell.mainView.backgroundColor = "5B9EE1".color_

            }else{
                cell.mainView.backgroundColor = greyWithOpacity
                cell.titlelbl.textColor = .black.withAlphaComponent(0.3)
            }
            return cell
        }
        
        else if collectionView == popularShoesCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productItemCollectionViewCell.identifier, for: indexPath) as!productItemCollectionViewCell
            cell.configure(model: popular_shoses[indexPath.row])
            return cell
        }
        
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: newArrivalCollectionViewCell.identifier, for: indexPath) as!newArrivalCollectionViewCell
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        self.isSelected = indexPath.row
        if collectionView == categoriesCollectionView {
            let previousSelectedIndexPath = selectedIndexPath
                 selectedIndexPath = indexPath
                 
                 var indexPaths: [IndexPath] = [indexPath]
                 if let previousSelectedIndexPath = previousSelectedIndexPath {
                     indexPaths.append(previousSelectedIndexPath)
                 }
                 
                 collectionView.performBatchUpdates {
                     collectionView.reloadItems(at: indexPaths)
                 }
            
        }else if collectionView == popularShoesCollectionView {
            print("Seletect")
            let vc = UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: "DetailsVC")
            vc.push()
        }

    }
    

    
}
extension HomeVC : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoriesCollectionView {
            return CGSize(width: 105, height: 44)
//            return CGSize(width: 44, height: 44) // Default size if needed

        }else if collectionView == popularShoesCollectionView{
            let padding: CGFloat = 10 // 10 points for each side
            let collectionViewSize = collectionView.frame.width - padding

            return CGSize(width: collectionViewSize/2 - 10, height:200)
//            
//            
//            let width : CGFloat = (collectionView.frame.width - 20)/2
//            //            let height : CGFloat = width * (107/148)
//            let size : CGSize = CGSize(width: width, height: 200)
//            return size
        }else{
            //            return collectionView.frame.size
            let width : CGFloat = (collectionView.frame.width - 20)/1
            let height : CGFloat = 120
            let size : CGSize = CGSize(width: width, height: height)
            return size
        }
        
    }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

class CollectionViewAdjusetHeight : UICollectionView {
    override var intrinsicContentSize: CGSize{
        self.layoutIfNeeded()
        return self.contentSize
    }
    
    
    override var contentSize: CGSize {
        didSet{
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
    }
}
