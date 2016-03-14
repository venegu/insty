//
//  LoginViewController.swift
//  insty
//
//  Created by Gale on 3/8/16.
//  Copyright © 2016 Gale. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {


    @IBOutlet weak var usernameField: CustomTextField!
    @IBOutlet weak var passwordField: CustomTextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Diagonal Gradients
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds

        let color1 = UIColor(red: 122.0/255, green: 79.0/255, blue: 174.0/255, alpha: 1.0).CGColor as CGColorRef
        let color2 = UIColor(red: 143.0/255, green: 75.0/255, blue: 155.0/255, alpha: 1.0).CGColor as CGColorRef
        let color3 = UIColor(red: 163.0/255, green: 42.0/255, blue: 150.0/255, alpha: 1.0).CGColor as CGColorRef
        let color4 = UIColor(red: 179.0/255, green: 49.0/255, blue: 128.0/255, alpha: 1.0).CGColor as CGColorRef
        
        gradientLayer.colors = [color1, color2, color3, color4]
        gradientLayer.locations = [0.0, 0.25, 0.75, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
        self.view.backgroundColor = UIColor(red: 200.0/255, green: 69.0/255, blue: 110.0/255, alpha: 1.0)
        
        // Configuring Button and Text Field Apperance
        usernameField.layer.cornerRadius = 2
        passwordField.layer.cornerRadius = 2
        
        signInButton.layer.cornerRadius = 2
        signInButton.layer.borderWidth = 1
        signInButton.layer.borderColor = UIColor.whiteColor().CGColor
        signInButton.enabled = false
        
        signUpButton.layer.cornerRadius = 2
        signUpButton.layer.borderWidth = 1
        signUpButton.layer.borderColor = UIColor.whiteColor().CGColor
        signUpButton.enabled = false
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignUp(sender: AnyObject) {
        let newUser = PFUser()
        
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        
        newUser.signUpInBackgroundWithBlock { (success: Bool, error:
            NSError?) -> Void in
            if success {
                print("User")
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            } else {
                print(error?.localizedDescription)
                
                if error?.code == 202 {
                    print("Username taken")
                }
            }
        }
    }

    @IBAction func onSignIn(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(usernameField.text!, password: passwordField.text!) { (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                print("logged in")
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }
            
        }
    }
    
    
    @IBAction func onPasswordEditingChange(sender: AnyObject) {
        if passwordField.text == "" {
            signInButton.enabled = false
            UIButton.animateWithDuration(0.5, animations: {
                self.signInButton.alpha = 0.6
            })
            
            signUpButton.enabled = false
            UIButton.animateWithDuration(0.5, animations: {
                self.signUpButton.alpha = 0.6
            })
            
        } else {
            if usernameField.text != "" {
                signInButton.enabled = true
            
                UIButton.animateWithDuration(0.5, animations: {
                    self.signInButton.alpha = 1.0
                })
            
                signUpButton.enabled = true
                UIButton.animateWithDuration(0.5, animations: {
                    self.signUpButton.alpha = 1.0
                })
            }
        }
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - Custom Text Field Class

class CustomTextField: UITextField{
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        self.layer.cornerRadius = 2
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(white: 1, alpha: 0.1).CGColor
        
        self.backgroundColor = UIColor(white: 1, alpha: 0.07)
        
        self.textColor = UIColor.whiteColor()
        let str = NSAttributedString(string: self.placeholder!, attributes: [NSForegroundColorAttributeName:UIColor(red: 200.0/255, green: 200.0/255, blue: 200.0/255, alpha: 1.0)])
        self.attributedPlaceholder = str
    }
    
}