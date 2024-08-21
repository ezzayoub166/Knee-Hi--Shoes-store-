//
//  UIKitEx.swift
//  ReviosnIOSTotourial
//
//  Created by ezz on 23/04/2024.
//

import Foundation
import UIKit
class rView : UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height / 2
    }
}

class rLabel : UILabel {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.width / 2
    }
}
class rButton : UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.width / 2
    }
}

class rImage : UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height / 2
    }
}
