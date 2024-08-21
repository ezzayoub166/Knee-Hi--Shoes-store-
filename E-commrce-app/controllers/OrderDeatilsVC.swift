//
//  OrderDeatilsVC.swift
//  Shoes-EcommApp
//
//  Created by ezz on 11/08/2024.
//

import UIKit

class OrderDeatilsVC: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTABLEVIEW()

    }  
    
    @IBAction func backToHome(_ sender: Any) {
        AppDelegate.shared?.rootNaviagtionController?.popToRootViewController(animated: true)
    }
    
    
    private func setupTABLEVIEW(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.selectionFollowsFocus = false
        tableView.register(UINib(nibName: OrderItemOfShoseTC.identifier, bundle: nil), forCellReuseIdentifier: OrderItemOfShoseTC.identifier)
        
    }

}
extension OrderDeatilsVC : UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Make the background color show through
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
         let headerView = UIView()
         headerView.backgroundColor = UIColor.clear
         return headerView
     }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }else{
            return 10
        }
       
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderItemOfShoseTC.identifier, for: indexPath) as! OrderItemOfShoseTC
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    
}
