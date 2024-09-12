//
//  ShoeNewArrivalCell.swift
//  E-commrce-app
//
//  Created by ezz on 10/09/2024.
//

import UIKit

class ShoeNewArrivalCell: UICollectionViewCell {
    
    static let identifier = "ShoeNewArrivalCell"

    // Define the UI elements
    let bestChoiceLabel: UILabel = {
        let label = UILabel()
        label.text = "Best Choice"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let shoeNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nike Jordan"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$493.00"
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let shoeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "photo.fill") // Replace with actual image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model : ShoeModel){
        self.shoeImageView.sd_setImage(with: URL(string: model.images[0]))
        self.priceLabel.text = model.price + " $"
        self.shoeNameLabel.text = model.title
    }
    
    // Setup layout using constraints
    private func setupLayout() {
        // Add subviews
        contentView.addSubview(bestChoiceLabel)
        contentView.addSubview(shoeNameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(shoeImageView)
        
        // Best Choice Label Constraints
        NSLayoutConstraint.activate([
            bestChoiceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            bestChoiceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8)
        ])
        
        // Shoe Name Label Constraints
        NSLayoutConstraint.activate([
            shoeNameLabel.topAnchor.constraint(equalTo: bestChoiceLabel.bottomAnchor, constant: 8),
            shoeNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            shoeNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: shoeImageView.leadingAnchor, constant: -20)
        ])
        
        // Price Label Constraints
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: shoeNameLabel.bottomAnchor, constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            priceLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8)
        ])
        
        // Shoe Image View Constraints
        NSLayoutConstraint.activate([
            shoeImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            shoeImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            shoeImageView.widthAnchor.constraint(equalToConstant: 120),
            shoeImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
