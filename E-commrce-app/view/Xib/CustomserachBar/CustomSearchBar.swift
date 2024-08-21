//
//  CustomSearchBar.swift
//  Shoes-EcommApp
//
//  Created by ezz on 06/08/2024.
//

import UIKit

class CustomSearchBar: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var seatchtxtFiled: UITextField!
    
    var text : String?{
        return self.seatchtxtFiled.text
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureXnib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureXnib()
    }
    
    private func configureXnib(){
        Bundle.main.loadNibNamed("CustomSearchBar", owner: self, options: [:])
        contentView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        contentView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true

        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true

        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        contentView.layoutIfNeeded()

        
    }
}
