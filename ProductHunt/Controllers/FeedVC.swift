//
//  FeedVC.swift
//  ProductHunt
//
//  Created by Macbook Pro 15 on 4/15/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {
    
    var posts: [Post] = [] {
       didSet {
           feedTableView.reloadData()
       }
    }
    var networkManager = NetworkManager()
    
    @IBOutlet weak var feedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        updateFeed()
    }
    
    fileprivate func setupTableView() {
        feedTableView.delegate = self
        feedTableView.dataSource = self
    }
    
    func updateFeed() {
      // call our network manager's getPosts method to update our feed with posts
       networkManager.getPosts() { result in
           self.posts = result
       }
    }
}

extension FeedVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get the storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        // Get the commentsView from the storyboard
        guard let commentsView = storyboard.instantiateViewController(withIdentifier: "commentsView") as? CommentsVC else {
            return
        }
        // add mock comments
        commentsView.comments = ["Blah blah blah!", "Good app.", "Wow."]
        navigationController?.pushViewController(commentsView, animated: true)
    }
    
}

extension FeedVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // dequeue and return an available cell, instead of creating a new cell
        let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.identifier, for: indexPath) as! PostCell
        // retrieve from the actual posts, and not mock data
        let post = posts[indexPath.row]
        cell.post = post
        return cell
    }
}
