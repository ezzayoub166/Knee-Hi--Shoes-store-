//
//  CustomNavigationBarViewController.swift
//  Shoes-EcommApp
//
//  Created by ezz on 05/08/2024.
//

import UIKit

class CustomNavigationBarViewController: UIView {

    @IBOutlet weak var contentView: UIView!
    
        
    @IBOutlet weak var subTitle: UILabel!
    
    @IBOutlet weak var rightside: UIView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var imaginsideTitle: UIImageView!
    
    
    
    @IBOutlet weak var titlelbl: UILabel!
    
    
    @IBInspectable var titleText : String?{
        set{
            self.titlelbl.text = newValue
        }get{
            return self.titlelbl.text
        }
    }
    
    @IBInspectable var isBack: Bool = false {
        didSet {
            // Move the image setting logic here
            if isBack {
                DispatchQueue.main.async {
                    self.leftSideimg?.image = UIImage(named: "directionleft")
                }
            }
        }
    }
    
    @IBInspectable var isShowOnlyTitle : Bool = false {
        didSet{
            if isShowOnlyTitle {
                self.subTitle.isHidden = true
                self.imaginsideTitle.isHidden = true
            }
        }
    }
    
    @IBInspectable var isHiddenRightSide : Bool = false {
        didSet{
            if isHiddenRightSide {
                self.rightside.isHidden = true
            }
        }
    }


    
    
    @IBOutlet weak var leftSideimg: UIImageView!
    
    var callSideButton : (()->())?
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureXnib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureXnib()
    }
    
    
    @IBAction func leftSideBtn(_ sender: Any) {

//        self.callSideButton?()
        self.topVC?.pop()
        
    }
    
    private func configureXnib(){
        Bundle.main.loadNibNamed("CustomNavigationBarViewController", owner: self, options: [:])
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
