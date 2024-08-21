//
//  MyCartVC.swift
//  Shoes-EcommApp
//
//  Created by ezz on 09/08/2024.
//

import UIKit

class MyCartVC: UIViewController {
    
    @IBOutlet weak var nav: CustomNavigationBarViewController!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var bottomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupdata()
        fetchData()
        loclized()
        
    }
    
    
    @IBAction func checkOutBtn(_ sender: Any) {
        let vc = UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: "PaymentVC")
        vc.push()
    }
    
}

extension MyCartVC {
    private func setupView(){
      setupTABLEVIEW()
        self.isHiddenNavigation = true
        bottomView.roundCorners(corners: [.topLeft,.topRight], radius: 20)
        nav.callSideButton = {
            self.pop()
        }
        
        
    }
    private func setupdata(){
        
    }
    private func fetchData(){
        
    }
    private func loclized(){
        
    }
    private func setupTABLEVIEW(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.register(UINib(nibName: cartItemTCell.identifier, bundle: nil), forCellReuseIdentifier: cartItemTCell.identifier)
        
    }
}

extension MyCartVC : UITableViewDelegate , UITableViewDataSource {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cartItemTCell.identifier, for: indexPath) as! cartItemTCell
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 85
//    }

    
}
