//
//  PostCell.swift
//  insty
//
//  Created by Gale on 3/12/16.
//  Copyright © 2016 Gale. All rights reserved.
//

import UIKit
import ParseUI
import Parse

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
    
    var post: PFObject! {
        didSet {
            let author = post["author"] as? PFUser
            self.nameLabel.text = author?.username!
            self.timeLabel.text = Post.gettingTimestamp(post.createdAt!.timeIntervalSinceNow)
            
            if let mediaData = post["media"] as? PFFile {
                self.photoImageView.file = mediaData
                self.photoImageView.loadInBackground()
            }
            
            self.captionLabel.text = post["caption"] as? String
        }
    }
}
