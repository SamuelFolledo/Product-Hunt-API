//
//  UserView.swift
//  ProductHunt
//
//  Created by Macbook Pro 15 on 4/19/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class UserView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
//    var user: User!
    
//    required init(user: User) { //with initializer
//        super.init(frame: .zero)
//        self.user = user
//        setupView()
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    fileprivate func commonInit() {
        Bundle.main.loadNibNamed("UserView", owner: self, options: nil)
        addSubview(contentView)
        contentView.backgroundColor = .red
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func populateView(user: User) {
        imgView.image = UIImage(named: "placeholderImage")!
        nameLabel.text = user.name
    }
    
//    fileprivate func setupView() {
//        commonInit()
//        imgView.image = UIImage(named: "placeholderImage")!
//        nameLabel.text = user.name
//    }
}
