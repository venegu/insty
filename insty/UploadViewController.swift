//
//  UploadViewController.swift
//  insty
//
//  Created by Gale on 3/9/16.
//  Copyright © 2016 Gale. All rights reserved.
//

import UIKit

class UploadViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var importedImage: UIImageView!
    @IBOutlet weak var photoCaptionField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        print("Image selected")
        self.dismissViewControllerAnimated(true, completion: nil)
        importedImage.image = image
    }
    
    @IBAction func onSubmitButton(sender: AnyObject) {
        let resizeImage = Post.resize(importedImage.image!, newSize: CGSize(width: 250, height: 250))
        Post.postUserImage(resizeImage, withCaption: photoCaptionField.text) { (success: Bool, error: NSError?) -> Void in
            
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
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}

