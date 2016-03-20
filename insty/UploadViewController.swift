//
//  UploadViewController.swift
//  insty
//
//  Created by Gale on 3/9/16.
//  Copyright © 2016 Gale. All rights reserved.
//

import UIKit
import MBProgressHUD

class UploadViewController: UIViewController {
    
    @IBOutlet weak var importedImage: UIImageView!
    @IBOutlet weak var photoCaptionField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let logo = UIImage(named: "Instagram")!
        let imageView = UIImageView(image: logo)
        imageView.frame.size.height = (navigationController?.navigationBar.frame.size.height)! - 15
        imageView.contentMode = .ScaleAspectFit
        navigationItem.titleView = imageView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onUploadImage(sender: AnyObject) {
        
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.Camera
        image.allowsEditing = false
        self.presentViewController(image, animated: true, completion: nil)
    }
    
    @IBAction func onLibraryImage(sender: AnyObject) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = false
        self.presentViewController(image, animated: true, completion: nil)
    }
    
    @IBAction func onSubmitButton(sender: AnyObject) {
        MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        
        let resizeImage = Post.resize(importedImage.image!, newSize: CGSize(width: 250, height: 250))
        Post.postUserImage(resizeImage, withCaption: photoCaptionField.text) { (success: Bool, error: NSError?) -> Void in
            MBProgressHUD.hideHUDForView(self.view, animated: true)
            if success {
                self.importedImage.image = nil
                self.photoCaptionField.text = nil
                self.tabBarController?.selectedIndex = 0
                
            } else {
                // Network error pop up?
                print("Error posting image")
                print(error?.localizedDescription)
            }
            
        }
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
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

// MARK: - UIImagePickerControllerDelegate 
extension UploadViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    // Image Picker methods
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        print("Image selected")
        self.dismissViewControllerAnimated(true, completion: nil)
        importedImage.image = image
    }
}

