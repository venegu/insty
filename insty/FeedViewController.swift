//
//  FeedViewController.swift
//  insty
//
//  Created by Gale on 3/9/16.
//  Copyright © 2016 Gale. All rights reserved.
//

import UIKit
import Parse
import AMScrollingNavbar

class FeedViewController: ScrollingNavigationViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var posts: [PFObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let navigationController = self.navigationController as? ScrollingNavigationController {
            navigationController.followScrollView(tableView, delay: 50.0)
        }
        
        let logo = UIImage(named: "Instagram")!
        let imageView = UIImageView(image: logo)
        imageView.frame.size.height = (navigationController?.navigationBar.frame.size.height)! - 15
        imageView.contentMode = .ScaleAspectFit
        navigationItem.titleView = imageView
        
        tableView.delegate = self
        tableView.dataSource = self
        fetchPosts()
        
        // Initialize a UIRefreshControl
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "refreshControlAction:", forControlEvents: UIControlEvents.ValueChanged)
        tableView.insertSubview(refreshControl, atIndex: 0)
    }
    
    // Making sure most recent post is showing && time crunch better way to do this?
    override func viewWillAppear(animated: Bool) {
        fetchPosts()
        tableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        if let navigationController = self.navigationController as? ScrollingNavigationController {
            navigationController.followScrollView(tableView, delay: 50.0)
        }
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        if let navigationController = self.navigationController as? ScrollingNavigationController {
            navigationController.stopFollowingScrollView()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Getting and displayng 20 posts from Parse
    func fetchPosts() {
        let query = PFQuery(className: "Post")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
            if let posts = posts {
                self.posts = posts
                self.tableView.reloadData()
            } else {
                // Network error handling here
                print(error?.localizedDescription)
            }
        }
        
    }
    
    func refreshControlAction(refreshControl: UIRefreshControl) {
        fetchPosts()
        refreshControl.endRefreshing()
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

// MARK: - UITableViewDataSource
extension FeedViewController: UITableViewDataSource, UITableViewDelegate {
    // table view data source methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("InstagramCell", forIndexPath: indexPath) as! PostCell
        cell.delegate = self
        if posts != nil {
            let post = posts![indexPath.row]
            cell.post = post
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

}

// MARK: - PostCellDelegate
extension FeedViewController: PostCellDelegate {
    // Post cell methods
    
    func postCellAuthorProfile(sender: AnyObject?) {
        print("ran")
        let view = (sender as! UITapGestureRecognizer).view
        let cell = view?.superview?.superview as! PostCell
        
        let profileViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ProfileViewController") as! ProfileViewController
        self.navigationController?.pushViewController(profileViewController, animated: true)
        profileViewController.image = cell.profileImageView.file
        profileViewController.username = cell.nameLabel.text
    }
}
