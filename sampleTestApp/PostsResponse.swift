//
//  PostsResponse.swift
//  sampleMVCApp
//
//  Created by Bmsils on 09/11/17.
//  Copyright © 2017 Bmsils. All rights reserved.
//

import Foundation

struct PostResponse {
    let posts: [Post]
    
    init(json: Any) throws {
        guard let array = json as? [[String:Any]] else
        { throw NetworkingError.someError}
        var posts = [Post]()
        for item in array{
            
            guard let post = Post(dict: item) else{continue}
            posts.append(post)
        }
        self.posts = posts
    }
}
