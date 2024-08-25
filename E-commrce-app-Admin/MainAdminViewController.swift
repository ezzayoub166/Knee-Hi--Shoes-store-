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

struct SizeItem : Hashable {
    let color: String
    let type: String
    let size: Int
}


class MainAdminViewController: UIViewController {
    
    @IBOutlet weak var sizesTableView: TableViewAdjusetHeight!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var compents : [RadioModle] = [
        RadioModle(id: 0,
                   name: "Green",
                   codeColor: "#008000",
                   avaible_sizes_categories: [
                    AvalibleSizeType(
                        name: TypeSizeEnum.EU,
                        values: [
                            Size_Item_model(id: "0", values: 44),
                            Size_Item_model(id: "1", values: 46),
                            Size_Item_model(id: "2", values: 48),
                            Size_Item_model(id: "3", values: 50),
                            Size_Item_model(id: "4", values: 52),
                            Size_Item_model(id: "5", values: 54),
                            Size_Item_model(id: "6", values: 56),
                            Size_Item_model(id: "7", values: 58),
                            Size_Item_model(id: "8", values: 60),
                            Size_Item_model(id: "9", values: 62),
                        ]
                    ),
                    AvalibleSizeType(
                        name: TypeSizeEnum.US,
                        values: [
                            Size_Item_model(id: "10", values: 34),
                            Size_Item_model(id: "11", values: 36),
                            Size_Item_model(id: "12", values: 38),
                            Size_Item_model(id: "13", values: 40),
                            Size_Item_model(id: "14", values: 42),
                            Size_Item_model(id: "15", values: 44),
                            Size_Item_model(id: "16", values: 46),
                            Size_Item_model(id: "17", values: 48),
                            Size_Item_model(id: "18", values: 50),
                            Size_Item_model(id: "19", values: 52),
                        ]
                    ),
                    AvalibleSizeType(
                        name: TypeSizeEnum.UK,
                        values: [
                            Size_Item_model(id: "20", values: 34),
                            Size_Item_model(id: "21", values: 36),
                            Size_Item_model(id: "22", values: 38),
                            Size_Item_model(id: "23", values: 40),
                            Size_Item_model(id: "24", values: 42),
                            Size_Item_model(id: "25", values: 44),
                            Size_Item_model(id: "26", values: 46),
                            Size_Item_model(id: "27", values: 48),
                            Size_Item_model(id: "28", values: 50),
                            Size_Item_model(id: "29", values: 52),
                        ]
                    ),
                   ]
                  ),
        RadioModle(id: 2,
                   name: "Red",
                   codeColor: "#FF0000",
                   avaible_sizes_categories: [
                    AvalibleSizeType(
                        name: TypeSizeEnum.EU,
                        values: [
                            Size_Item_model(id: "0", values: 44),
                            Size_Item_model(id: "1", values: 46),
                            Size_Item_model(id: "2", values: 48),
                            Size_Item_model(id: "3", values: 50),
                            Size_Item_model(id: "4", values: 52),
                            Size_Item_model(id: "5", values: 54),
                            Size_Item_model(id: "6", values: 56),
                            Size_Item_model(id: "7", values: 58),
                            Size_Item_model(id: "8", values: 60),
                            Size_Item_model(id: "9", values: 62),
                        ]
                    ),
                    AvalibleSizeType(
                        name: TypeSizeEnum.US,
                        values: [
                            Size_Item_model(id: "10", values: 34),
                            Size_Item_model(id: "11", values: 36),
                            Size_Item_model(id: "12", values: 38),
                            Size_Item_model(id: "13", values: 40),
                            Size_Item_model(id: "14", values: 42),
                            Size_Item_model(id: "15", values: 44),
                            Size_Item_model(id: "16", values: 46),
                            Size_Item_model(id: "17", values: 48),
                            Size_Item_model(id: "18", values: 50),
                            Size_Item_model(id: "19", values: 52),
                        ]
                    ),
                    AvalibleSizeType(
                        name: TypeSizeEnum.UK,
                        values: [
                            Size_Item_model(id: "20", values: 34),
                            Size_Item_model(id: "21", values: 36),
                            Size_Item_model(id: "22", values: 38),
                            Size_Item_model(id: "23", values: 40),
                            Size_Item_model(id: "24", values: 42),
                            Size_Item_model(id: "25", values: 44),
                            Size_Item_model(id: "26", values: 46),
                            Size_Item_model(id: "27", values: 48),
                            Size_Item_model(id: "28", values: 50),
                            Size_Item_model(id: "29", values: 52),
                        ]
                    ),
                   ]
                  )
    ]
    
    
    
    
    var arrayOfSizes: [String: [String: Any]] = [
        "Red": [
            "code": "12345",
            "EU": [44, 46, 48, 50, 52, 54, 56, 58, 60, 62],
            "US": [34, 36, 38, 40, 42, 44, 46, 48, 50, 52],
            "UK": [34, 36, 38, 40, 42, 44, 46, 48, 50, 52]
        ],
        "Green": [
            "code": "23223",
            "EU": [44, 46, 48, 50, 52, 54, 56, 58, 60, 62],
            "US": [34, 36, 38, 40, 42, 44, 46, 48, 50, 52],
            "UK": [34, 36, 38, 40, 42, 44, 46, 48, 50, 52]
        ]
    ]
    
    var expandedSections: Set<String> = []
    //Use a dictionary to store the checked state for each cell based on its index path.
    var checkedStates: [IndexPath: Bool] = [:]
    
    
    
    
    lazy var sectionTitles: [String] = {
        return Array(arrayOfSizes.keys)
    }()
    
    
    
    @IBOutlet weak var genderDropDown: IQDropDownTextField!
    
    @IBOutlet weak var brandsDropDown: IQDropDownTextField!
    
    var arrayoOfImages : [UIImage?] = []
    
    var flattenedSizes: [SizeItem] = []
    
    
    
    
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupview()
        setupdata()
        fetchData()
        flattenSizesData()
        //        var arrayOfSizes = arrayOfSizes.filter { $0.key != "code" }
        
        
    }
    
    
    @IBAction func setImagesForProduct(_ sender: Any) {
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
            picker.dismiss(animated: true, completion: nil)
        }
        
        present(picker, animated: true, completion: nil)
        
    }
}

//MARK: - extension for main Functions ..........

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
        sizesTableView.register(CheckSizeCell.self, forCellReuseIdentifier: CheckSizeCell.identifier)
        sizesTableView.register(SizeCellCheck.self, forCellReuseIdentifier: SizeCellCheck.identifier)
        saveToDatabase()
        
        
        
    }
    
    private func setupIQDropDown(){
        genderDropDown.delegate = self
        genderDropDown.dataSource = self
        brandsDropDown.delegate = self
        brandsDropDown.dataSource = self
        //        genderDropDown.isOptionalDropDown = true
        genderDropDown.itemList = Gender.allCases.map { $0.rawValue }
        //        brandsDropDown.isOptionalDropDown = true
        brandsDropDown.itemList = Shose_brands.allCases.map{$0.rawValue}
        
    }
    
    private func setUpCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    // Flatten the nested size data into a single array of SizeItem
    func flattenSizesData() {
        for (color, sizesDict) in arrayOfSizes {
            for (type, sizes) in sizesDict where type != "code" {
                if let sizeArray = sizes as? [Int] {
                    for size in sizeArray {
                        flattenedSizes.append(SizeItem(color: color, type: type, size: size))
                    }
                }
            }
        }
    }
    
    // Prepare the selected sizes for saving
    func prepareSelectedSizesForSaving() -> [String: Any] {
        var selectedSizes: [String: Any] = [:]
        
        for (indexPath, isChecked) in checkedStates where isChecked {
            let sizeItem = flattenedSizes[indexPath.row]
            var colorDict = selectedSizes[sizeItem.color] as? [String: [Int]] ?? [:]
            var sizeArray = colorDict[sizeItem.type] ?? []
            sizeArray.append(sizeItem.size)
            colorDict[sizeItem.type] = sizeArray
            selectedSizes[sizeItem.color] = colorDict
        }
        
        return selectedSizes
    }
    
    // Function to save the data to the database
    func saveToDatabase() {
        let dataToSave = prepareSelectedSizesForSaving()
        // Implement the database saving logic here
        print("Data to save: \(dataToSave)")
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
            } else {
                self?.expandedSections.remove(obj.name) // Collapse section
            }
            tableView.reloadSections(IndexSet(integer: section), with: .automatic) // Reload the section
        }
        
        return headerView
    }
    
    // Height for the header view
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40 // Adjust the height as needed
    }
    
    // Cell for each row in the section
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let color = Array(arrayOfSizes.keys)[indexPath.section]
        let colorData = arrayOfSizes[color]!
        
        // Size cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "SizeCellCheck", for: indexPath) as! SizeCellCheck
        let obj = compents[indexPath.section]
        
        var flattenedIndex = 0
          
          for sizeCategory in obj.avaible_sizes_categories {
              let sizeCount = sizeCategory.values.count
              if indexPath.row < flattenedIndex + sizeCount {
                  // We found the correct size category and size item for this row
                  let sizeItem = sizeCategory.values[indexPath.row - flattenedIndex]
                  cell.valuelbl.text = "\(sizeItem.values)"
                  cell.typelbl.text = sizeCategory.name.rawValue
                  return cell
              }
              flattenedIndex += sizeCount
          }
        
        //        cell.typelbl.text = flattenedSizeItems[indexPath.row].type
        //        cell.valuelbl.text = "\(flattenedSizeItems[indexPath.row].size)"
        
        
        
        cell.checkBox.on = checkedStates[indexPath] ?? false // Get checkbox state
        
        // Handle checkbox value change for sizes
        cell.didTapCheckBox = { [weak self] isChecked in
            self?.checkedStates[indexPath] = isChecked // Update the state
        }
        
        return cell
    }
    
    // Height for each row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40 // Adjust the height for size cells
    }
}

struct FlattenedSizeItem {
    let color: String
    let type: String
    let size: Int
}

/*
 
 
 extension MainAdminViewController : UITableViewDelegate , UITableViewDataSource {
 func numberOfSections(in tableView: UITableView) -> Int {
 return sectionTitles.count
 }
 
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 let key = sectionTitles[section]
 return arrayOfSizes[key]?.count ?? 0
 }
 func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
 let key = sectionTitles[section]
 return key
 }
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 let cell : CheckSizeCell = tableView.dequeueReusableCell(withIdentifier: CheckSizeCell.identifier, for: indexPath) as! CheckSizeCell
 let key = sectionTitles[indexPath.section]
 let sizes = arrayOfSizes[key]
 if let sizes = sizes {
 cell.sizeValue.text = "\(sizes[indexPath.row])"
 }
 // Set the checkbox state
 cell.checkBox.on = checkedStates[indexPath] ?? false
 
 // Handle checkbox value change
 cell.checkBox.delegate = cell
 // Handle checkbox tap with a closure
 cell.didTapCheckBox = { [weak self] isChecked in
 self?.checkedStates[indexPath] = isChecked
 }
 return cell
 }
 func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
 return 40
 }
 
 }
 
 */

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
        print(item)
    }
    
}

//class CheckSizeCell : UITableViewCell , BEMCheckBoxDelegate {
//
//    @IBOutlet weak var sizeValue: UILabel!
//
//    @IBOutlet weak var checkBox: BEMCheckBox!
//
//    static let identifier = "CheckSizeCell"
//
//    var didTapCheckBox: ((Bool) -> Void)?
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        checkBox.delegate = self
//    }
//
//    func didTap(_ checkBox: BEMCheckBox) {
//        didTapCheckBox?(checkBox.on)
//    }
//}

class CheckSizeCell: UITableViewCell, BEMCheckBoxDelegate {
    
    // Create the label and checkbox programmatically
    let sizeValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16) // Set your desired font
        label.textColor = .black // Set your desired text color
        return label
    }()
    
    let checkBox: BEMCheckBox = {
        let checkBox = BEMCheckBox()
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        checkBox.onAnimationType = .bounce // Customize the animation type if needed
        checkBox.offAnimationType = .bounce
        checkBox.boxType = .square
        checkBox.offFillColor = .darkGray
        checkBox.onCheckColor = .white
        return checkBox
    }()
    
    // Closure to handle checkbox tap
    var didTapCheckBox: ((Bool) -> Void)?
    
    // Static identifier for dequeuing
    static let identifier = "CheckSizeCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Add subviews to the content view
        contentView.addSubview(sizeValue)
        contentView.addSubview(checkBox)
        
        // Set constraints for sizeValue label
        NSLayoutConstraint.activate([
            sizeValue.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            sizeValue.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            sizeValue.trailingAnchor.constraint(equalTo: checkBox.leadingAnchor, constant: -16)
        ])
        
        // Set constraints for checkBox
        NSLayoutConstraint.activate([
            checkBox.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            checkBox.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            checkBox.widthAnchor.constraint(equalToConstant: 24), // Set a specific width
            checkBox.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        // Set the checkbox delegate
        checkBox.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // BEMCheckBoxDelegate method
    func didTap(_ checkBox: BEMCheckBox) {
        didTapCheckBox?(checkBox.on)
    }
}


class SizeCellCheck : UITableViewCell , BEMCheckBoxDelegate {
    
    static let identifier = "SizeCellCheck"
    
    let typelbl : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AirbnbCereal_W_Bd", size: 16)
        label.text = "US"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let valuelbl : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AirbnbCereal_W_Bd", size: 16)
        label.text = "12"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let checkBox : BEMCheckBox = {
        let checkBox = BEMCheckBox()
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        return checkBox
    }()
    
    var didTapCheckBox: ((Bool) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        checkBox.delegate = self
    }
    
    @objc(didTapCheckBox:) func didTap(_ checkBox: BEMCheckBox) {
        didTapCheckBox?(checkBox.on)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubViews() {
        self.contentView.addSubview(typelbl)
        self.contentView.addSubview(valuelbl)
        self.contentView.addSubview(checkBox)
        
        // Activate constraints
        NSLayoutConstraint.activate([
            // typelbl constraints
            typelbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            typelbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            typelbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            // valuelbl constraints
            valuelbl.leadingAnchor.constraint(equalTo: typelbl.trailingAnchor, constant: 10),
            valuelbl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            valuelbl.trailingAnchor.constraint(lessThanOrEqualTo: checkBox.leadingAnchor, constant: -10),
            
            // checkBox constraints
            checkBox.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            checkBox.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            checkBox.heightAnchor.constraint(equalToConstant: 24),
            checkBox.widthAnchor.constraint(equalToConstant: 24),
        ])
    }
    
    
    
    
}

class ImageCell : UICollectionViewCell  {
    static let identifier = "ImageCell"
    
    @IBOutlet weak var coverImage: UIImageView!
    
    func configure(image : UIImage){
        self.coverImage.image = image
        
    }
    
}

class SizeHeaderView: UIView , BEMCheckBoxDelegate {
    
    // Create the label and checkbox programmatically
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16) // Set your desired font
        label.textColor = .black // Set your desired text color
        return label
    }()
    
    let checkBox: BEMCheckBox = {
        let checkBox = BEMCheckBox()
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        checkBox.onAnimationType = .bounce // Customize the animation type if needed
        checkBox.offAnimationType = .bounce
        checkBox.boxType = .square
        checkBox.offFillColor = .darkGray
        checkBox.onCheckColor = .white
        return checkBox
    }()
    
    // Closure to handle checkbox tap
    var didTapCheckBox: ((Bool) -> Void)?
    
    // Static identifier for dequeuing
    static let identifier = "CheckSizeCell"
    
    
    // BEMCheckBoxDelegate method
    func didTap(_ checkBox: BEMCheckBox) {
        didTapCheckBox?(checkBox.on)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        // Add subviews to the content view
        addSubview(titleLabel)
        addSubview(checkBox)
        
        // Set constraints for sizeValue label
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: checkBox.leadingAnchor, constant: -16)
        ])
        
        // Set constraints for checkBox
        NSLayoutConstraint.activate([
            checkBox.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            checkBox.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkBox.widthAnchor.constraint(equalToConstant: 24), // Set a specific width
            checkBox.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        // Set the checkbox delegate
        checkBox.delegate = self // Set a background color for the header
    }
}

class TableViewAdjusetHeight : UITableView {
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
