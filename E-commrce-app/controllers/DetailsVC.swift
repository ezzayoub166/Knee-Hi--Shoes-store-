//
//  DetailsVC.swift
//  Shoes-EcommApp
//
//  Created by ezz on 07/08/2024.
//

import UIKit
import FirebaseFirestore

class DetailsVC: UIViewController {
    
    
    //    @IBOutlet weak var imagesColledtionView: UICollectionView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var title_lbl: UILabel!
    
    @IBOutlet weak var price_lbl: UILabel!
    
    @IBOutlet weak var descreptionlbl: UILabel!
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    
    var obj : ShoeModel?
    
    var idDocument : String?
    

    
    //MARK: - IBOutlet
    @IBOutlet weak var colorCollectionView: UICollectionView!
    
    @IBOutlet weak var sizesStringCollectionView: UICollectionView!
    
    
    @IBOutlet weak var sizesNumbersCollectionView: UICollectionView!
    
    
    @IBOutlet weak var customNav: CustomNavigationBarViewController!
    
    
    @IBOutlet weak var containrView: UIView!{
        didSet{
            self.containrView.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var continerBottom: UIView!{
        didSet{
            self.containrView.clipsToBounds = false
        }
    }
    
    
    //MARK: - Varibles
    var selectedColorIndex: Int = 0  {
        didSet{
            self.colorCollectionView.reloadData()
            self.sizesStringCollectionView.reloadData()
            self.sizesNumbersCollectionView.reloadData()
            DispatchQueue.global().async {
                //                Requests.saveShoseINDATABASE(model: self.obj)
            }
            
        }
    }
    var selectedSizeTypeIndex: Int = 0 {
        didSet{
            
            self.colorCollectionView.reloadData()
            self.sizesStringCollectionView.reloadData()
            self.sizesNumbersCollectionView.reloadData()
            
        }
    }
    var selectedSizeValueIndex : Int = 0 {
        didSet{
            self.sizesNumbersCollectionView.reloadData()
            self.colorCollectionView.reloadData()
            self.sizesStringCollectionView.reloadData()
        }
    }
    
    
    
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupdata()
        fetchData()
        loclized()
        
    }
    
    //MARK: - viewWillLayoutSubviews
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupBottomViewRounded()
    }
    
    
    // This function updates the size values when a new size category is selected
      func updateSizeValues() {
          sizesNumbersCollectionView.reloadData()
      }
}



//MARK: - Main Extension
extension DetailsVC {
    func setupView(){
        setUpCollectionView()
        customNav.callSideButton = {
            self.pop()
        }
        scrollView.showsVerticalScrollIndicator = false
//        makeSomeEffective()
//        imgCover.setImage(url: obj?.images.first ?? "")
        title_lbl.text = obj?.title
        price_lbl.text = (obj?.price ?? "0") + " $"
        descreptionlbl.text = obj?.Description
    }
    func fetchData(){
        
    }
    func setupdata(){
        
    }
    func loclized(){
        
    }
    
}

extension DetailsVC {
    
    func setupBottomViewRounded(){
        // Call the roundCorners() func right there.
        containrView.roundCorners(corners: [.topLeft, .topRight], radius: 30)
        continerBottom.roundCorners(corners: [.topLeft, .topRight], radius: 30)
    }
    
    func setUpCollectionView(){
        
        //        imagesColledtionView.dataSource = self
        //        imagesColledtionView.delegate = self
        
        colorCollectionView.delegate = self
        colorCollectionView.dataSource = self
        
        sizesStringCollectionView.dataSource = self
        sizesStringCollectionView.delegate = self
        sizesStringCollectionView.isScrollEnabled = false
        
        
        
        sizesNumbersCollectionView.dataSource = self
        sizesNumbersCollectionView.delegate = self
        sizesStringCollectionView.isScrollEnabled = false
        
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        imageCollectionView.showsHorizontalScrollIndicator = false
        imageCollectionView.register(UINib(nibName: imageCoverDeatilsCell.identifier, bundle: nil), forCellWithReuseIdentifier: imageCoverDeatilsCell.identifier)
    
        
        
        
    }
    
    func makeSomeEffective(){
        
        continerBottom.addTopCornersShadow(shadowColor: .darkGray, shadowOpacity: 0.7, shadowRadius: 0.8, shadowOffset: CGSize(width: 0, height: 10))
    }
}

//MARK: - CollectionView
extension DetailsVC : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case colorCollectionView :
            return obj?.colors.count ?? 0
        case sizesStringCollectionView:
            return obj?.colors[self.selectedColorIndex].avaible_sizes_categories.count ?? 0
        case sizesNumbersCollectionView:
            self.sizesNumbersCollectionView.reloadData()
            return obj?.colors[self.selectedColorIndex].avaible_sizes_categories[self.selectedSizeTypeIndex].values.count ?? 0
        case imageCollectionView:
            return obj?.images.count ?? 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == colorCollectionView {
            let cell : ColorCell = collectionView.dequeueCVCell(indexPath: indexPath)
            let colorModel = obj?.colors[indexPath.row]
            let selected = indexPath.row == selectedColorIndex
            cell.configure(model: colorModel! , selected :selected)
            return cell
        }else if collectionView == sizesStringCollectionView {
            let cell : SizeTypeCell = collectionView.dequeueCVCell(indexPath: indexPath)
            let sizeCategory = obj!.colors[selectedColorIndex].avaible_sizes_categories[indexPath.row].name
            let selected = selectedSizeTypeIndex == indexPath.row
            if selected {
                cell.titlelbl.textColor = .black
            }else{
                cell.titlelbl.textColor = .gray
            }
            cell.configure(name: sizeCategory)
            return cell
        }else if collectionView == sizesNumbersCollectionView{
            
            let cell: SizeValueCell = collectionView.dequeueCVCell(indexPath: indexPath)
            let value = obj?.colors[selectedColorIndex].avaible_sizes_categories[selectedSizeTypeIndex].values[indexPath.item]
                let isSelected = selectedSizeValueIndex == indexPath.row
            cell.configure(with: value?.value ?? 0, isSelected: isSelected)
            
            return cell
        }else if collectionView == imageCollectionView {
            let cell : imageCoverDeatilsCell = collectionView.dequeueCVCell(indexPath: indexPath)
            let image = obj?.images[indexPath.row]
            cell.configure(imageUrl: image ?? "")
            return cell
        }
        
        else {
            return UICollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == colorCollectionView {
            selectedColorIndex = indexPath.row
            colorCollectionView.reloadData()
            sizesStringCollectionView.reloadData()
            sizesNumbersCollectionView.reloadData()
        } else if collectionView == sizesStringCollectionView {
            selectedSizeTypeIndex = indexPath.row
            colorCollectionView.reloadData()
            sizesStringCollectionView.reloadData()
            sizesNumbersCollectionView.reloadData()
        }else if collectionView == sizesNumbersCollectionView {
            selectedSizeValueIndex = indexPath.row
            print("Selected Size Value Index: \(selectedSizeValueIndex)")
            colorCollectionView.reloadData()
            sizesStringCollectionView.reloadData()
            sizesNumbersCollectionView.reloadData()
        }
    }
}







