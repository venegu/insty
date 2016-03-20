//
//  LoginButton.swift
//  insty
//
//  Created by Gale on 3/19/16.
//  Copyright © 2016 Gale. All rights reserved.
//

import UIKit

@IBDesignable
class LoginButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 2.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var fontColor: UIColor = UIColor.whiteColor() {
        didSet {
            self.tintColor = fontColor
        }
    }
    
    override func awakeFromNib() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.enabled = false
    }
    
}
