//
//  MainAdminViewController.swift
//  E-commrce-app-Admin
//
//  Created by ezz on 20/08/2024.
//

import UIKit
import BEMCheckBox
import IQDropDownTextField
import YPImagePicker
import ProgressHUD
import FirebaseFirestore
import FirebaseStorage
import FirebaseDatabaseInternal

struct SizeItem : Hashable {
    let color: String
    let type: String
    let size: Int
}


class MainAdminViewController: UIViewController {
    
    @IBOutlet weak var sizesTableView: TableViewAdjusetHeight!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var titletxt: UITextField!
    
    @IBOutlet weak var descreptiontxt: UITextField!
    
    @IBOutlet weak var pricetxt: UITextField!
    
    @IBOutlet weak var genderDropDown: IQDropDownTextField!
    
    @IBOutlet weak var brandsDropDown: IQDropDownTextField!
    
    @IBOutlet weak var isPopularCheck: BEMCheckBox!
    
    @IBOutlet weak var isNewArrivalCheck: BEMCheckBox!
    
    
    
    var arrayoOfImages : [UIImage] = []
    var arrayOfUrls : [String] = []
    
    
    var compents = ConstantsAdmin.compents
    
    var expandedSections: Set<String> = []
    
    var selectedSections: Set<String> = []
    
    
    var checkedStates: [IndexPath: Bool] = [:]
    
    var selectedGender : String = ""
    
    var selectedBrandModel : String = ""
    
    let _db = Firestore.firestore()
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupview()
        setupdata()
        fetchData()
        
        
        
        
    }
    
    @IBAction func saveProductTp(_ sender: Any) {
        //
        //        SKActivityIndicator.show()
        //        uploadImages(images: arrayoOfImages)
        //        SKActivityIndicator.show()
        
        
        let selectedSizes = compents.map{ item in
            (item,item.avaible_sizes_categories.map{item in (item.name.rawValue,item.values.filter{$0.isChecked!}.compactMap{$0.value})})
        }
        
        var radio_models : [RadioModle] = []
        
        
        for selectedSize in selectedSizes {
            if(self.expandedSections.contains(selectedSize.0.name)){
                // Map over avaible_sizes_categories to filter the checked sizes
                let filteredCategories = selectedSize.0.avaible_sizes_categories.map { sizeCategory in
                    // Filter the sizes within the category
                    let filteredSizes = sizeCategory.values.filter { $0.isChecked ?? false }
                    // Return a new AvalibleSizeType with the filtered sizes
                    return AvalibleSizeType(name: sizeCategory.name, values: filteredSizes)
                }
                
                // Create a new RadioModle with the filtered categories
                let obj = RadioModle(
                    id: selectedSize.0.id,
                    name: selectedSize.0.name,
                    codeColor: selectedSize.0.codeColor ?? "",
                    avaible_sizes_categories: filteredCategories
                )
                
                // Use `obj` as needed
                // print(selectedSize)
                print("\n")
                print(obj)
                radio_models.append(obj)
            }
        }
        
        guard let title = titletxt.text , !title.isEmpty else {
            //            self.showToast("Title is required")
            ProgressHUD.failed("Title is required")
            return
            
        }
        
        guard let descreption = descreptiontxt.text , !descreption.isEmpty else {
            //            self.showToast("descreption is required")
            ProgressHUD.failed("descreption is required")
            
            return
            
        }
        
        guard let price = pricetxt.text , !price.isEmpty else {
            ProgressHUD.failed("price is required")
            return
            
        }
        
        guard !selectedGender.isEmpty else {
            //            self.showToast("gender is required")
            ProgressHUD.failed("Gender is required")
            
            return
        }
        guard !selectedBrandModel.isEmpty else {
            //            self.showToast("gender is required")
            ProgressHUD.failed("Brand is required")
            return
        }
        
        guard !arrayOfUrls.isEmpty else {
            ProgressHUD.failed("Images is required")
            return
        }
        
        
        let object = Shose_model(title: title, shoseId: "", price: price, description: descreption, isPopular: isPopularCheck.on, isNewArrival: isNewArrivalCheck.on, isWishList: false, shose_brand: selectedBrandModel, gender: Gender(rawValue: selectedGender) ?? Gender.none, colors: radio_models, images: arrayOfUrls)
        
        
        SKActivityIndicator.show()
        var ref: DocumentReference? = nil
        ref = _db.collection("shoses").addDocument(data: object.toDictionary()) { error in
            if error != nil{
                SKActivityIndicator.dismiss()
                self.showErrorMessage(message: error?.localizedDescription)
                
            } else if let ref = ref {
                // Get document ID and update the document with it
                ref.updateData(["shoseId": ref.documentID]) { error in
                    SKActivityIndicator.dismiss()
                    self.showAlert(title: "SUCCESS", message: "ADDED PRODUCT") {
                        self.titletxt.text = ""
                        self.descreptiontxt.text = ""
                        self.pricetxt.text = ""
                        self.arrayOfUrls.removeAll()
                        self.arrayoOfImages.removeAll()
                        self.expandedSections.removeAll()
                        self.collectionView.reloadData()
                        self.sizesTableView.reloadData()
                        self.dismiss(animated: true)
                    }
                    if let error = error {
                        self.showErrorMessage(message: error.localizedDescription)
                    } else {
                        // Success, document ID saved inside the document
                        print("Document successfully updated with ID: \(ref.documentID)")
                    }
                }
            }
        }
    }
    
    func showAlert(title : String? , message : String?,buttonTitle1 : String = "OK", buttonAction1:@escaping(() -> Void)){
            let alert = UIAlertController(title:title, message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: buttonTitle1, style: .default,handler: {action in
            buttonAction1()
        })
            alert.addAction(okayAction)
            self.present(alert, animated: true)
    }
    
    func showErrorMessage(message : String?){
        let alert = UIAlertController(title:"Warrining", message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .destructive) { action in
            
        }
        
        alert.addAction(cancelAction)
       self.present(alert, animated: true)
    }
    
    
    
    @IBAction func setImagesForProduct(_ sender: Any) {
        let selectedSizes = compents.map{ item in
            (item,item.avaible_sizes_categories.map{item in (item.name.rawValue,item.values.filter{$0.isChecked!}.compactMap{$0.value})})
        }
        
        for selectedSize in selectedSizes {
            if(self.expandedSections.contains(selectedSize.0.name)){
                // Map over avaible_sizes_categories to filter the checked sizes
                let filteredCategories = selectedSize.0.avaible_sizes_categories.map { sizeCategory in
                    // Filter the sizes within the category
                    let filteredSizes = sizeCategory.values.filter { $0.isChecked ?? false }
                    // Return a new AvalibleSizeType with the filtered sizes
                    return AvalibleSizeType(name: sizeCategory.name, values: filteredSizes)
                }
                
                // Create a new RadioModle with the filtered categories
                var obj = RadioModle(
                    id: selectedSize.0.id,
                    name: selectedSize.0.name,
                    codeColor: selectedSize.0.codeColor ?? "",
                    avaible_sizes_categories: filteredCategories
                )
                
                // Use `obj` as needed
                // print(selectedSize)
                print("\n")
                print(obj)
            }
        }
        
        
        
        //        print(selectedSizes)
        
        //        let selectedSizes = compents.flatMap { component in
        //            component.avaible_sizes_categories.flatMap { sizeCategory in
        //                sizeCategory.values.filter { $0.isChecked! }
        //            }
        //
        //        }
        
        // `selectedSizes` will now contain all selected sizes across all categories
        //        print("Selected Sizes: \(selectedSizes.map{$0.values})")
        
        
        arrayoOfImages.removeAll()
        var config = YPImagePickerConfiguration()
        
        config.library.options = nil
        config.library.onlySquare = false
        config.library.isSquareByDefault = true
        config.library.minWidthForItem = nil
        config.library.mediaType = YPlibraryMediaType.photo
        config.library.defaultMultipleSelection = false
        config.library.maxNumberOfItems = 1
        config.library.minNumberOfItems = 1
        config.library.numberOfItemsInRow = 4
        config.library.spacingBetweenItems = 1.0
        config.library.skipSelectionsGallery = false
        config.library.preselectedItems = nil
        config.library.preSelectItemOnMultipleSelection = true
        
        config.gallery.hidesRemoveButton = false
        config.library.maxNumberOfItems = 3
        let picker = YPImagePicker(configuration: config)
        
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto    {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta)
                // Print exif meta data of original image.
                //                self.imageCover.image = photo.image
                self.arrayoOfImages.append(photo.image)
                self.collectionView.reloadData()
            }
            picker.dismiss(animated: true, completion: nil)
        }
        picker.didFinishPicking { [unowned picker] items, cancelled in
            for item in items {
                switch item {
                case .photo(let photo):
                    self.arrayoOfImages.append(photo.image)
                    
                    self.collectionView.reloadData()
                case .video(let video):
                    print(video)
                }
            }
            self.uploadImages(images: self.arrayoOfImages)
            picker.dismiss(animated: true, completion: nil)
        }
        
        
        present(picker, animated: true, completion: nil)
        
    }
}

//MARK: - extension [FOR] main Functions ..........

extension MainAdminViewController {
    private func setupview(){
        setupTABLEVIEW()
        setupIQDropDown()
        setUpCollectionView()
        
        
    }
    private func setupdata(){
        
    }
    private func loclized(){
        
    }
    private func fetchData(){
        
    }
    
    
}

//MARK: - Extension for other functions....

extension MainAdminViewController {
    private func setupTABLEVIEW(){
        sizesTableView.dataSource = self
        sizesTableView.delegate = self
        //        sizesTableView.register(CheckSizeCell.self, forCellReuseIdentifier: CheckSizeCell.identifier)
        sizesTableView.register(SizeCellCheck.self, forCellReuseIdentifier: SizeCellCheck.identifier)
        
        
        
    }
    
    private func setupIQDropDown(){
        genderDropDown.delegate = self
        genderDropDown.dataSource = self
        brandsDropDown.delegate = self
        brandsDropDown.dataSource = self
        genderDropDown.itemList = Gender.allCases.map { $0.rawValue }
        brandsDropDown.itemList = ConstantsAdmin.categories_arr.map{$0.title!}
        
    }
    
    private func setUpCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    func uploadImages(images: [UIImage]) {
        for (index, image) in images.enumerated() {
            guard let data = image.jpegData(compressionQuality: 0.6) else {
                print("Failed to compress image at index \(index)")
                continue
            }
            
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpg"
            let i = Database.database().reference().childByAutoId()
            
            let refStorage = Storage.storage().reference().child("images").child(i.key ?? "")
            
            let uploadTask = refStorage.putData(data, metadata: metadata)
            
            uploadTask.observe(.progress) { snapshot in
                let percentComplete = 100.0 * Double(snapshot.progress!.completedUnitCount) / Double(snapshot.progress!.totalUnitCount)
                print("Upload progress for image \(index + 1): \(percentComplete)%")
                ProgressHUD.progress(percentComplete/100.0)
            }
            
            uploadTask.observe(.failure) { snapshot in
                ProgressHUD.failed("Failed to upload image , try again")
            }
            
            uploadTask.observe(.success) { snapshot in
                ProgressHUD.dismiss()
            }
            
            refStorage.putData(data, metadata: metadata) { (result, error) in
                if let error = error {
                    print("Upload error for image \(index + 1): \(error.localizedDescription)")
                    return
                }
                
                    refStorage.downloadURL { result in
                        switch result {
                        case .success(let url):
                            print("Image uploaded successfully: \(url.absoluteString)")
                            self.arrayOfUrls.append(url.absoluteString)
                            print(self.arrayOfUrls)
                            
                        case .failure(let error):
                            print("Download URL error for image \(error.localizedDescription)")
                        }
                    }
            }
        }
    }

    
    func ubloadImage(image:UIImage){
        
        let data = image.jpegData(compressionQuality:0.6)
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        let i = Database.database().reference().childByAutoId()
        
        
        let refStorage = Storage.storage().reference().child("images").child(i.key ?? "")
        
        let uploadTask = refStorage.putData(data!, metadata: metadata)
        
        uploadTask.observe(.progress) { snapshot in
            
            let percentComplete = 100.0 * Double(snapshot.progress!.completedUnitCount)
            / Double(snapshot.progress!.totalUnitCount)
 
            print(percentComplete)
            ProgressHUD.progress(percentComplete/100.0)
            
        }
        

        uploadTask.observe(.failure) { snapshot in
            
            ProgressHUD.failed("Failed to upload image try again")

        }
        
        uploadTask.observe(.success) { snapshot in
            ProgressHUD.dismiss()
        }
        

        refStorage.putData(data!, metadata: metadata) { (result, error) in
            
            
            if error != nil {
                print("upload\(error?.localizedDescription ?? "")")
                return
            }
            
            refStorage.downloadURL { result in
                switch result {
                case .success(let url):
                    print("Image uploaded successfully: \(url.absoluteString)")
//                    self.value["image\(index)"] = url.absoluteString
//                    if index == images.count - 1 {
//                        self.btn_UploadImage.setTitle("All images have been uploaded.".localized, for: .normal)
//                    }
                    
                case .failure(let error):
                    print("Download URL error for image \(error.localizedDescription)")
                }
            }
            
        }
    }
    
    
    
    
}

//MARK: - Extension For table view
/*
 
 */
extension MainAdminViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Number of sections in the table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return compents.count
    }
    
    // Number of rows in each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let obj = compents[section]
        if expandedSections.contains(obj.name){
            // Calculate the total number of sizes across all size categories for the expanded section
            var totalSizes = 0
            for sizeCategory in obj.avaible_sizes_categories {
                totalSizes += sizeCategory.values.count
            }
            return totalSizes
        }else{
            return 0
        }
        
    }
    
    // View for header in each section
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = SizeHeaderView()
        let obj = compents[section]
        
        // Set the title for the header (you can customize this further if needed)
        headerView.titleLabel.text = obj.name
        headerView.backgroundColor = obj.codeColor?.color_
        
        // Configure the checkbox based on the expansion state
        headerView.checkBox.on = expandedSections.contains(obj.name)
        headerView.didTapCheckBox = { [weak self] isChecked in
            if isChecked {
                self?.expandedSections.insert(obj.name) // Expand section
                self?.selectedSections.insert(obj.name)
                
            } else {
                self?.expandedSections.remove(obj.name) // Collapse section
                self?.selectedSections.remove(obj.name)
            }
            tableView.reloadSections(IndexSet(integer: section), with: .automatic) // Reload the section
        }
        
        return headerView
    }
    
    // Height for the header view
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40 // Adjust the height as needed
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SizeCellCheck.identifier, for: indexPath) as! SizeCellCheck
        
        let color = compents[indexPath.section]
        var flattenedIndex = 0
        
        for (categoryIndex, sizeCategory) in color.avaible_sizes_categories.enumerated() {
            let sizeCount = sizeCategory.values.count
            if indexPath.row < flattenedIndex + sizeCount {
                let sizeItemIndex = indexPath.row - flattenedIndex
                let sizeItem = compents[indexPath.section].avaible_sizes_categories[categoryIndex].values[sizeItemIndex]
                
                cell.configureCell(with: sizeItem, sizeType: sizeCategory.name.rawValue) { isSelected in
                    self.compents[indexPath.section].avaible_sizes_categories[categoryIndex].values[sizeItemIndex].isChecked = isSelected
                }
                
                return cell
            }
            flattenedIndex += sizeCount
        }
        
        return cell
    }
    
    
    // Height for each row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40 // Adjust the height for size cells
    }
}
extension MainAdminViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as! ImageCell
        let object = arrayoOfImages[indexPath.row]
        cell.configure(image: (object ??  UIImage(systemName: "photo.on.rectangle"))!)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayoOfImages.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
}

extension MainAdminViewController : IQDropDownTextFieldDelegate , IQDropDownTextFieldDataSource {
    
    func textField(_ textField: IQDropDownTextField, didSelectItem item: String?, row: Int) {
        // Handle the selection using a closure
        guard let selectedItem = item else {
            return
        }
        if textField == brandsDropDown {
            selectedBrandModel = selectedItem
        }else if textField == genderDropDown {
            selectedGender = selectedItem
        }
        
        
    }
    
}
