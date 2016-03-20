//
//  LoginTextField.swift
//  insty
//
//  Created by Gale on 3/19/16.
//  Copyright © 2016 Gale. All rights reserved.
//

import UIKit

@IBDesignable
class LoginTextField: UITextField {
    
    @IBInspectable var inset: CGFloat = 0
    
    @IBInspectable var cornerRadius: CGFloat = 2.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, inset, inset)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return textRectForBounds(bounds)
    }
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 2.0
        self.backgroundColor = UIColor(white: 1, alpha: 0.07)
        
        self.textColor = UIColor.whiteColor()
        let str = NSAttributedString(string: self.placeholder!, attributes: [NSForegroundColorAttributeName:UIColor(red: 200.0/255, green: 200.0/255, blue: 200.0/255, alpha: 1.0)])
        self.attributedPlaceholder = str
    }
}
