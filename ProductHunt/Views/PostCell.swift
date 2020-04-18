//
//  PostCell.swift
//  ProductHunt
//
//  Created by Macbook Pro 15 on 4/18/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    static let identifier: String = "postCell"
    var post: Post? {
        didSet {
            // make sure we return if post doesn't exist
            guard let post = post else { return }
            // Assign our UI elements to their post counterparts
            nameLabel.text = post.name
            taglineLabel.text = post.tagline
            commentsCountLabel.text = "Comments: \(post.commentsCount)"
            votesCountLabel.text = "Votes: \(post.votesCount)"
            // We'll write this next!
            updatePreviewImage()
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var commentsCountLabel: UILabel!
    @IBOutlet weak var votesCountLabel: UILabel!
    @IBOutlet weak var previewImageView: UIImageView!
    
    func updatePreviewImage() {
       // make sure we return if post doesn't exist
       guard let post = post else { return }
       // assign the placeholder image to the UI element
       previewImageView.image = UIImage(named: "placeholderImage")
    }
}
