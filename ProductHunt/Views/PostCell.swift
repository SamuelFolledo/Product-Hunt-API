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
//            taglineLabel.text = post.makers[0].name
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
    @IBOutlet weak var makerStackView: UIStackView!
    
    override func prepareForReuse() { //reset the cell
        self.nameLabel.text = ""
        self.taglineLabel.text = ""
        self.votesCountLabel.text = "Votes: 0"
        self.commentsCountLabel.text = "Comments: 0"
        self.previewImageView.image = UIImage(named: "placeholderImage")!
    }
    
    func updatePreviewImage() {
        // make sure we return if post doesn't exist
        guard let post = post else { return }
        // assign the placeholder image to the UI element
        post.fetchImage { (image, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print(error)
                    self.previewImageView.image = UIImage(named: "placeholderImage")
                    return
                }
                self.previewImageView.image = image!
            }
        }
//        let user = User(name: "Kobe", imageURL: ImageURL(the50Px: ""))
//        let view = UserView()
//        view.populateView(user: user)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.addConstraints([
//            view.heightAnchor.constraint(equalToConstant: 50),
//            view.widthAnchor.constraint(equalToConstant: 50),
//        ])
//        makerStackView.addArrangedSubview(view)
//        let user2 = User(name: "Kobe2", imageURL: ImageURL(the50Px: ""))
//        let view2 = UserView()
//        view2.populateView(user: user2)
//        makerStackView.addArrangedSubview(view2)
//        let user3 = User(name: "Kobe3", imageURL: ImageURL(the50Px: ""))
//        let view3 = UserView()
//        view3.populateView(user: user3)
//        makerStackView.addArrangedSubview(view3)
//        let user4 = User(name: "Kobe4", imageURL: ImageURL(the50Px: ""))
//        let view4 = UserView()
//        view4.populateView(user: user4)
//        makerStackView.addArrangedSubview(view4)
    }
}
