//
//  MainAdminViewController.swift
//  E-commrce-app-Admin
//
//  Created by ezz on 20/08/2024.
//

import UIKit
import BEMCheckBox

class MainAdminViewController: UIViewController {
    
    @IBOutlet weak var sizesTableView: TableViewAdjusetHeight!
    
    var arrayOfSizes  = [
        "EU" : [44 , 46 , 48 , 50 , 52 , 54 , 56 ,58 , 60 ,62],
        "US" : [34 , 36 , 38 , 40 , 42 , 44 , 46 ,48 , 50 ,52],
        "UK" : [34 , 36 , 38 , 40 , 42 , 44 , 46 ,48 , 50 ,52],
    ]
    
    lazy var sectionTitles: [String] = {
           return Array(arrayOfSizes.keys)
       }()
       


    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupview()
        setupdata()
        fetchData()
       
    }
    
}

//MARK: - extension for main Functions ..........

extension MainAdminViewController {
    private func setupview(){
        setupTABLEVIEW()
        
    }
    private func setupdata(){
        
    }
    private func loclized(){
        
    }
    private func fetchData(){
        
    }
    
    
}

//MARK: - Extension for other functions.

extension MainAdminViewController {
    private func setupTABLEVIEW(){
        sizesTableView.dataSource = self
        sizesTableView.delegate = self
        
    }
}

//MARK: - Extension For table view
extension MainAdminViewController : UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = sectionTitles[section]
        return arrayOfSizes[key]?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CheckSizeCell = tableView.dequeueReusableCell(withIdentifier: CheckSizeCell.identifier, for: indexPath) as! CheckSizeCell
        let key = sectionTitles[indexPath.section]
        let sizes = arrayOfSizes[key]
        if let sizes = sizes {
            cell.CategorySize.text = key
            cell.sizeValue.text = "\(sizes[indexPath.row])"
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    
    
}


class CheckSizeCell : UITableViewCell {
    
    @IBOutlet weak var CategorySize: UILabel!
    
    
    @IBOutlet weak var sizeValue: UILabel!
    
    @IBOutlet weak var checkBox: BEMCheckBox!
    
    static let identifier = "CheckSizeCell"
//
//    func configure(key : String , value : Int ){
//        CategorySize.text = key
//        sizeValue.text = "\(value)"
//        checkBox.on = isContain
//
//    }
    
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
