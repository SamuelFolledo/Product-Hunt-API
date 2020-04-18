//
//  Comment.swift
//  ProductHunt
//
//  Created by Macbook Pro 15 on 4/18/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import Foundation

struct CommentApiResponse: Decodable {
   let comments: [Comment]
}

struct Comment: Decodable {
 let id: Int
 let body: String
}
