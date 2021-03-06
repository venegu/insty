//
//  Post.swift
//  insty
//
//  Created by Gale on 3/12/16.
//  Copyright © 2016 Gale. All rights reserved.
//

import UIKit
import Parse

class Post: NSObject {
    
    /**
     Method to post user media to Parse by uploading image file
     
     - parameter image: Image that the user wants upload to parse
     - parameter caption: Caption text input by the user
     - parameter completion: Block to be executed after save operation is complete
     */
    class func postUserImage(image: UIImage?, withCaption caption: String?, withCompletion completion: PFBooleanResultBlock?) {
        // Create Parse object PFObject
        let media = PFObject(className: "Post")
        
        print("Posting user image")
        // Add relevant fields to the object
        media["media"] = getPFFileFromImage(image) // PFFile column type
        media["author"] = PFUser.currentUser() // Pointer column type that points to PFUser
        media["caption"] = caption
        media["likesCount"] = 0
        media["commentsCount"] = 0
        media["createdAt"] = "\(NSDate())"

        // Save object (following function will save the object in Parse asynchronously)
        media.saveInBackgroundWithBlock(completion)
        print("user image save complete")
    }
    
    /**
     Method to post user media to Parse by uploading image file
     
     - parameter image: Image that the user wants to upload to parse
     - returns: PFFile for the the data in the image
     */
    class func getPFFileFromImage(image: UIImage?) -> PFFile? {
        // check if image is not nil
        if let image = image {
            // get image data and check if that is not nil
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }
    
    class func resize(image: UIImage, newSize: CGSize) -> UIImage {
        let resizeImageView = UIImageView(frame: CGRectMake(0, 0, newSize.width, newSize.height))
        resizeImageView.contentMode = UIViewContentMode.ScaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    class func postUserProfileImage(image: UIImage?, withCompletion completion: PFBooleanResultBlock?) {
        
        let user = PFObject(className: "UserData")
        user["username"] = (PFUser.currentUser()?.username)!
        user["profileImage"] = getPFFileFromImage(image)
        user.saveInBackgroundWithBlock (completion)
        print("done")
    }
    
    class func getUserProfileImage(username: String, success: (PFFile?) -> (), failure: (NSError?) -> ()) {
        let query = PFQuery(className: "UserData")
        query.whereKey("username", equalTo: username)
        
        query.getFirstObjectInBackgroundWithBlock { (user: PFObject?, error: NSError?) -> Void in
            if(error == nil) {
                success(user!["profileImage"] as? PFFile)
            } else {
                failure(error)
            }
        }
    }
    
    class func gettingTimestamp(time : NSTimeInterval) -> String {
        let timeSeconds = -Int(time)
        var timeSince: Int = 0
        
        if timeSeconds == 0 {
            return "Now"
        }
        
        if timeSeconds <= 60 {
            timeSince = timeSeconds
            return "\(timeSince)s"
        }
        
        if timeSeconds/60 < 60 {
            timeSince = timeSeconds/60
            return "\(timeSince)m"
        }
        
        if (timeSeconds/60)/60 < 24 {
            timeSince = (timeSeconds/60)/60
            return "\(timeSince)h"
        }
        
        if ((timeSeconds/60)/60)/24 < 365 {
            timeSince = ((timeSeconds/60)/60)/24
            return "\(timeSince)d"
        }
        
        if (((timeSeconds/60)/60)/24)/365 < 100 {
            timeSince = ((((timeSeconds)/60)/60)/24)/365
            return "\(timeSince)y"
        }
        
        return "\(timeSince)"
    }

}
