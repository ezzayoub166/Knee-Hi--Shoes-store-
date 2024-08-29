//
//  TableViewAdjusetHeight.swift
//  E-commrce-app-Admin
//
//  Created by ezz on 26/08/2024.
//

import Foundation
import UIKit

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
