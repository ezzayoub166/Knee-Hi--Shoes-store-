//
//  SizeHeaderView.swift
//  E-commrce-app-Admin
//
//  Created by ezz on 26/08/2024.
//

import Foundation
import BEMCheckBox
class SizeHeaderView: UIView , BEMCheckBoxDelegate {
    
    // Create the label and checkbox programmatically
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16) // Set your desired font
        label.textColor = .white // Set your desired text color
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
