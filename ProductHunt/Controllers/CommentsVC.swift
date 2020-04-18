//
//  CommentsVC.swift
//  ProductHunt
//
//  Created by Macbook Pro 15 on 4/18/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class CommentsVC: UIViewController {
    
    var comments: [String]! {
       didSet {
//           commentsTableView.reloadData()
       }
    }
    var networkManager = NetworkManager()
    
    @IBOutlet weak var commentsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
//        updateFeed()
    }
    
    fileprivate func setupTableView() {
        commentsTableView.delegate = self
        commentsTableView.dataSource = self
    }
    
    func updateFeed() {
      // call our network manager's getcomments method to update our feed with comments
       networkManager.getPosts() { result in
           self.comments = []
       }
    }
}

extension CommentsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! CommentCell
        let comment = comments[indexPath.row]
        cell.commentTextView.text = comment
        return cell
    }
}

// MARK: UITableViewDelegate
extension CommentsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}
