//
//  Post.swift
//  sampleMVCApp
//
//  Created by Bmsils on 09/11/17.
//  Copyright © 2017 Bmsils. All rights reserved.
//

import Foundation

struct Post {
    let title: String
    let body: String
    var selected : Bool
    
    init?(dict:[String:Any], selected:Bool = false) {
        guard let title = dict["title"] as? String,
              let created = dict["created_at"] as? String
       else { return nil }
        
        self.title = title
        self.body = created
        self.selected = selected
    }
}
