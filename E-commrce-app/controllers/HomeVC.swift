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
    
    @IBOutlet weak var constraint: NSLayoutConstraint!
    
   
    
    @IBOutlet weak var newArrivalsCollectionView: UICollectionView!
    
    
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.showsVerticalScrollIndicator = false
            scrollView.showsHorizontalScrollIndicator = false
        }
    }
    
    @IBOutlet weak var category_indictor: UIActivityIndicatorView!
    
    
    @IBOutlet weak var popular_indictor: UIActivityIndicatorView!
    
    
    
    @IBOutlet weak var newArrival_indicator: UIActivityIndicatorView!
    
    var selectedIndexPath: IndexPath? = IndexPath(row: 0, section: 0){
        didSet{
            DispatchQueue.main.async {
                self.categoriesCollectionView.reloadData()
            }
        }
    }
    
    var chooseBrand : String = ""
    
    var isSelected : Int = 0 {
        didSet{
            categoriesCollectionView.reloadData()
        }
        
    }
    
    
    
    var category_array : [Category_Item] = []
    
    var original_popular_shoes: [ShoeModel] = []
        var original_new_arrival_shoes: [ShoeModel] = []
        
        var popular_shoses: [ShoeModel] = []
        var new_arrival_shoses: [ShoeModel] = []
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        isHiddenNavigation = true
        setupView()
        setupData()
        fetchData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updatePopularShoesCollectionHeight()
    }

    private func updatePopularShoesCollectionHeight() {
        constraint.constant = popularShoesCollectionView.collectionViewLayout.collectionViewContentSize.height
    }

        

    @IBAction func seeAllPopular(_ sender: Any) {
        let vc = UIStoryboard.mainStoryBoard.instantiateViewController(identifier: "ItemsVC") as? ItemsVC
        vc?.arry_of_shoses = popular_shoses
        vc?.push()
    }
    
    
    @IBAction func sellAllNewArrivals(_ sender: Any) {
        let vc = UIStoryboard.mainStoryBoard.instantiateViewController(identifier: "ItemsVC") as? ItemsVC
        vc?.arry_of_shoses = new_arrival_shoses
        vc?.push()
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
        popularShoesCollectionView.isScrollEnabled = false

        
        newArrivalsCollectionView.delegate  = self
        newArrivalsCollectionView.dataSource = self
        newArrivalsCollectionView.showsHorizontalScrollIndicator = false
        
        newArrivalsCollectionView.isScrollEnabled = true
        popularShoesCollectionView.isScrollEnabled = false
        
        categoriesCollectionView.register(UINib(nibName: selectedCategoriesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: selectedCategoriesCollectionViewCell.identifier)
        
        popularShoesCollectionView.register(UINib(nibName: productItemCollectionViewCell.identifier, bundle: nil),forCellWithReuseIdentifier: productItemCollectionViewCell.identifier)
        
        newArrivalsCollectionView.register(ShoeNewArrivalCell.self, forCellWithReuseIdentifier: ShoeNewArrivalCell.identifier)
        
        
    }
    func setupData(){
        
    }
    func fetchData(){
        getCategories()
        fetchPopularProducts()
        fetchNewArrivalProducts()
        
    }
    
    
    
    //MARK: - for this status
    // when selected the specfic category we need to filter array of populars and new Arrival
    //Based on Brand
    
    
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
//        self.popular_indictor.startAnimating()
        ShoeService.shared.fetchDataBasedOnAttribute(completion: { result  in
            switch result {
            case .success(let shoses):
                // Store the fetched shoes in the original array
                        self.original_popular_shoes = shoses
                        // Initially, show all shoes (unfiltered)
                        self.popular_shoses = self.original_popular_shoes
                        
                        DispatchQueue.main.async {
                            self.popularShoesCollectionView.reloadData()
                            self.updatePopularShoesCollectionHeight()
                        }
//                self.popular_shoses = shoses
//                DispatchQueue.main.async { [self] in
//                    self.popularShoesCollectionView.reloadData()
//                    self.popularShoesCollectionView.layoutIfNeeded() // Ensure the layout is updated before calculating the height
//                    updatePopularShoesCollectionHeight()
////                    self.popular_indictor.stopAnimating()
////                    self.popular_indictor.hidesWhenStopped = true
//                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }, attribute: "isPopular", limit: 100)
        
    }
    
    private func fetchNewArrivalProducts(){
//        self.newArrival_indicator.startAnimating()
        self.new_arrival_shoses.removeAll()
        ShoeService.shared.fetchDataBasedOnAttribute(completion: { result  in
            switch result {
            case .success(let shoses):
                // Store the fetched shoes in the original array
                      self.original_new_arrival_shoes = shoses
                      // Initially, show all shoes (unfiltered)
                      self.new_arrival_shoses = self.original_new_arrival_shoes
                      
                      DispatchQueue.main.async {
                          self.newArrivalsCollectionView.reloadData()
                      }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }, attribute: "isNewArrival", limit: 100)
        
    }
    
    private func filterShoesBySelectedBrand() {
        // If no brand is selected, show all shoes
        if chooseBrand.isEmpty {
            self.popular_shoses = original_popular_shoes
            self.new_arrival_shoses = original_new_arrival_shoes
        } else {
            // Filter popular shoes by selected brand
            self.popular_shoses = original_popular_shoes.filter { shoe in
                return shoe.shoseBrand.lowercased() == chooseBrand.lowercased()
            }
            
            // Filter new arrival shoes by selected brand
            self.new_arrival_shoses = original_new_arrival_shoes.filter { shoe in
                return shoe.shoseBrand.lowercased() == chooseBrand.lowercased()
            }
        }
        
        // Reload the collection views with filtered data
        DispatchQueue.main.async {
            self.popularShoesCollectionView.reloadData()
            self.newArrivalsCollectionView.reloadData()
        }
    }


    
    
}
extension HomeVC : UICollectionViewDataSource , UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoriesCollectionView {
            return category_array.count
        }else if collectionView == popularShoesCollectionView  {
            return popular_shoses.count
        } else {
            return new_arrival_shoses.count
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
//                self.chooseBrand = self.category_array[indexPath.row].title ?? "Nike"
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
            let cell: ShoeNewArrivalCell = collectionView.dequeueCVCell(indexPath: indexPath)
            let obj = new_arrival_shoses[indexPath.row]
            cell.configure(with: obj)
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        self.isSelected = indexPath.row
        if collectionView == categoriesCollectionView {
            let previousSelectedIndexPath = selectedIndexPath
                 selectedIndexPath = indexPath
            
            // Update selected brand
                   chooseBrand = category_array[indexPath.row].title ?? ""

                   // Filter the popular and new arrival shoes based on the selected brand
                   filterShoesBySelectedBrand()

                 
                 var indexPaths: [IndexPath] = [indexPath]
                 if let previousSelectedIndexPath = previousSelectedIndexPath {
                     indexPaths.append(previousSelectedIndexPath)
                 }
            
                 collectionView.performBatchUpdates {
                     collectionView.reloadItems(at: indexPaths)
//                     filterShoesBySelectedBrand()

                 }
            
        }else if collectionView == popularShoesCollectionView {
            print("Seletect")
            let vc = UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: "DetailsVC") as? DetailsVC
            vc?.obj = popular_shoses[indexPath.row]
            vc?.push()
        } else {
            let vc = UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: "DetailsVC") as? DetailsVC
            vc?.obj = new_arrival_shoses[indexPath.row]
            vc?.push()
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

            return CGSize(width: collectionViewSize/2 - 5, height:200)
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





