//
//  PostCell.swift
//  insty
//
//  Created by Gale on 3/12/16.
//  Copyright © 2016 Gale. All rights reserved.
//

import UIKit
import Parse
import ParseUI

@objc protocol PostCellDelegate {
    optional func postCellAuthorProfile(sender: AnyObject?)
}

class PostCell: PFTableViewCell {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak var profileImageView: PFImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var photoImageView: PFImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    var delegate: PostCellDelegate?
    
    var post: PFObject! {
        didSet {
            
            let author = post["author"] as? PFUser
            self.nameLabel.text = author?.username!
            
            let nameTap = UITapGestureRecognizer(target: self, action: Selector("goToProfile:"))
            nameTap.numberOfTapsRequired = 1
            nameLabel.userInteractionEnabled = true
            nameLabel.addGestureRecognizer(nameTap)
            
            profileImageView.image = nil
            profileImageView.layer.cornerRadius = profileImageView.frame.size.height/2
            profileImageView.layer.borderWidth = 1
            profileImageView.layer.borderColor = UIColor.lightGrayColor().CGColor
            profileImageView.clipsToBounds = true
            
            Post.getUserProfileImage((author?.username!)!, success: { (imageData: PFFile?) -> () in
                if let imageData = imageData {
                    self.profileImageView.file = imageData
                    self.profileImageView.loadInBackground()
                }
                
                }) { (error : NSError?) -> () in
                    print(error?.localizedDescription)
            }
           
            
            self.timeLabel.text = Post.gettingTimestamp(post.createdAt!.timeIntervalSinceNow)
            
            photoImageView.image = nil
            if let mediaData = post["media"] as? PFFile {
                self.photoImageView.file = mediaData
                self.photoImageView.loadInBackground()
            }
            
            let profileTap = UITapGestureRecognizer(target: self, action: Selector("goToProfile:"))
            profileTap.numberOfTapsRequired = 1
            profileImageView.userInteractionEnabled = true
            profileImageView.addGestureRecognizer(profileTap)
            
            self.captionLabel.text = post["caption"] as? String
        }
    }
    
    func goToProfile(sender: UITapGestureRecognizer) {
        delegate?.postCellAuthorProfile!(sender)
        print("tapped")
    }
}
