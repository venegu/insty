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

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
