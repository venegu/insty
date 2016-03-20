//
//  LoginButton.swift
//  insty
//
//  Created by Gale on 3/19/16.
//  Copyright © 2016 Gale. All rights reserved.
//

import UIKit
import pop

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
        
        self.addTarget(self, action: "scaleToSmall", forControlEvents: .TouchDown)
        self.addTarget(self, action: "scaleToSmall", forControlEvents: .TouchDragEnter)
        self.addTarget(self, action: "springAnimation", forControlEvents: .TouchUpInside)
        self.addTarget(self, action: "scaleToDefault", forControlEvents: .TouchDragExit)
    }
    
    func scaleToSmall() {
        let scaleAnimation = POPBasicAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnimation.toValue = NSValue(CGSize: CGSizeMake(0.95, 0.95))
        self.layer.pop_addAnimation(scaleAnimation, forKey: "layerScaleSmallAnimation")
    }
    
    func springAnimation() {
        let scaleAnimation = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnimation.velocity = NSValue(CGSize: CGSizeMake(3.0, 3.0))
        scaleAnimation.toValue = NSValue(CGSize: CGSizeMake(1.0, 1.0))
        scaleAnimation.springBounciness = 18
        self.layer.pop_addAnimation(scaleAnimation, forKey: "layerSpringAnimation")
    }
    
    func scaleDefault() {
        let scaleAnimation = POPBasicAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnimation.toValue = NSValue(CGSize: CGSizeMake(1, 1))
        self.layer.pop_addAnimation(scaleAnimation, forKey: "layerDefaultAnimation")
    }
    
}
