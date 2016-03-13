//
//  ProfileViewController.swift
//  insty
//
//  Created by Gale on 3/9/16.
//  Copyright © 2016 Gale. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class ProfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var profileImageView: PFImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        profileImageView.layer.cornerRadius = profileImageView.frame.size.height/2
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.borderColor = UIColor.lightGrayColor().CGColor
        profileImageView.clipsToBounds = true
        
        getProfileImage()

        self.title = "\(PFUser.currentUser()!.username!)"
        
        let tap = UITapGestureRecognizer(target: self, action: Selector("setProfileImage:"))
        tap.numberOfTapsRequired = 1
        profileImageView.userInteractionEnabled = true
        profileImageView.addGestureRecognizer(tap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getProfileImage() {
        Post.getUserProfileImage((PFUser.currentUser()?.username!)!, success: { (userData: PFFile?) -> () in
            if let userData = userData {
                self.profileImageView.file = userData
                self.profileImageView.loadInBackground()
            }
            }) { (error: NSError?) -> () in
                print(error?.localizedDescription)
        }

        
    }
    
    func setProfileImage(sender: UITapGestureRecognizer) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = false
        self.presentViewController(image, animated: true, completion: nil)
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        profileImageView.image = image
        let resizeImage = Post.resize(profileImageView.image!, newSize: CGSize(width: 240, height: 240))
        Post.postUserProfileImage(resizeImage) { (success: Bool, error: NSError?) -> Void in
            if success {
                print("we have lift off!")
            } else {
                print(error?.localizedDescription)
            }
            
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func onLogoutButton(sender: AnyObject) {
        PFUser.logOutInBackgroundWithBlock { (error: NSError?) -> Void in
            if error == nil {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("LoginViewController")
                    self.presentViewController(viewController, animated: true, completion: nil)
                })
                print("outty - so sleepy")
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

