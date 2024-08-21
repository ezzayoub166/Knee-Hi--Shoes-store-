//
//  MyOrdersVC.swift
//  Shoes-EcommApp
//
//  Created by ezz on 11/08/2024.
//

import UIKit

class MyOrdersVC: UIViewController {

    @IBOutlet weak var ordersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTABLEVIEW()

        // Do any additional setup after loading the view.
    }
    
    private func setUpTABLEVIEW(){
        ordersTableView.delegate = self
        ordersTableView.dataSource = self
        ordersTableView.register(UINib(nibName: "orderTableViewCell", bundle: nil), forCellReuseIdentifier: "orderTableViewCell")
    }

}

extension MyOrdersVC :UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderTableViewCell", for: indexPath) as! orderTableViewCell
        return cell
    }
    
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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
