//
//  SizeCellCheck.swift
//  E-commrce-app-Admin
//
//  Created by ezz on 26/08/2024.
//

import Foundation
import UIKit
import BEMCheckBox
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
        checkBox.addTarget(self, action: #selector(didTap(_:)), for: .valueChanged)

    }
    
    func configureCell(with sizeItem: Size_Item_model, sizeType: String, onSelect: @escaping (Bool) -> Void) {
          valuelbl.text = "\(sizeItem.values)"
          typelbl.text = sizeType
        checkBox.on = sizeItem.isChecked ?? false
          didTapCheckBox = onSelect
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
