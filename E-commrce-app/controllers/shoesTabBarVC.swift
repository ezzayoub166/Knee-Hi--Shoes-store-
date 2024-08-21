//
//  shoesTabBarVC.swift
//  Shoes-EcommApp
//
//  Created by ezz on 07/08/2024.
//

import UIKit

class shoesTabBarVC: UITabBarController {
    
    private let btnMiddle: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        btn.setTitle("", for: .normal)
        btn.backgroundColor = "#5B9EE1".color_
        btn.layer.cornerRadius = 30
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOpacity = 0.2
        btn.layer.shadowOffset = CGSize(width: 4, height: 4)
        btn.setImage(UIImage(named: "middleCart"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomTabBar()
        view.addSubview(btnMiddle)
        setupMiddleButtonConstraints()
        btnMiddle.addTarget(self, action: #selector(cartBtn), for: .touchUpInside)
    }
    
    @objc private func cartBtn(){
        let vc = UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: "MyCartVC")
        vc.push()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.bringSubviewToFront(btnMiddle)
    }
    
    private func setupMiddleButtonConstraints() {
        NSLayoutConstraint.activate([
            btnMiddle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnMiddle.bottomAnchor.constraint(equalTo: tabBar.topAnchor, constant: 30),
            btnMiddle.widthAnchor.constraint(equalToConstant: 60),
            btnMiddle.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func setupCustomTabBar() {
        let path: UIBezierPath = getPathForTabBar()
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 3
        shape.strokeColor = UIColor.white.cgColor
        shape.fillColor = UIColor.white.cgColor
        
        // Adding shadow to the tab bar
        shape.shadowColor = UIColor.black.cgColor
        shape.shadowOpacity = 0.3
        shape.shadowOffset = CGSize(width: 0, height: 3)
        shape.shadowRadius = 5
        
        self.tabBar.layer.insertSublayer(shape, at: 0)
        self.tabBar.itemWidth = 40
        self.tabBar.itemPositioning = .centered
        self.tabBar.itemSpacing = 180
        self.tabBar.tintColor = "#5B9EE1".color_
//        self.tabBar.selectedItem.colo
    }
    
    func getPathForTabBar() -> UIBezierPath {
        let frameWidth = self.tabBar.bounds.width
        let frameHeight = self.tabBar.bounds.height + 30
        let holeWidth = 150
        let holeHeight = 50
        let leftXUntilHole = Int(frameWidth / 2) - Int(holeWidth / 2)
        
        let path: UIBezierPath = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: leftXUntilHole, y: 0)) // 1. Line
        path.addCurve(to: CGPoint(x: leftXUntilHole + (holeWidth / 3), y: holeHeight / 2), controlPoint1: CGPoint(x: leftXUntilHole + ((holeWidth / 3) / 8) * 6, y: 0), controlPoint2: CGPoint(x: leftXUntilHole + ((holeWidth / 3) / 8) * 8, y: holeHeight / 2)) // part I
        path.addCurve(to: CGPoint(x: leftXUntilHole + (2 * holeWidth) / 3, y: holeHeight / 2), controlPoint1: CGPoint(x: leftXUntilHole + (holeWidth / 3) + (holeWidth / 3) / 3 * 2 / 5, y: (holeHeight / 2) * 6 / 4), controlPoint2: CGPoint(x: leftXUntilHole + (holeWidth / 3) + (holeWidth / 3) / 3 * 2 + (holeWidth / 3) / 3 * 3 / 5, y: (holeHeight / 2) * 6 / 4)) // part II
        path.addCurve(to: CGPoint(x: leftXUntilHole + holeWidth, y: 0), controlPoint1: CGPoint(x: leftXUntilHole + (2 * holeWidth) / 3, y: holeHeight / 2), controlPoint2: CGPoint(x: leftXUntilHole + (2 * holeWidth) / 3 + (holeWidth / 3) * 2 / 8, y: 0)) // part III
        path.addLine(to: CGPoint(x: frameWidth, y: 0)) // 2. Line
        path.addLine(to: CGPoint(x: frameWidth, y: frameHeight)) // 3. Line
        path.addLine(to: CGPoint(x: 0, y: frameHeight)) // 4. Line
        path.addLine(to: CGPoint(x: 0, y: 0)) // 5. Line
        path.close()
        return path
    }
}
