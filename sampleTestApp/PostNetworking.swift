//
//  PostNetworking.swift
//  sampleMVCApp
//
//  Created by Bmsils on 09/11/17.
//  Copyright © 2017 Bmsils. All rights reserved.
//

import Foundation
class PostNetworking {
    private init(){}
    
    static func getPosts(completion: @escaping (PostResponse) -> Void){
        guard let url = URL.init(string: "https://hn.algolia.com/api/v1/search_by_date?tags=story") else {
            return
        }
        NetworkingServices.shared.getData(fromUrl: url){ (json) in
            do{
                let respons = try PostResponse(json:json)
                print(respons)
                completion(respons)
                
            }catch{
                
                
            }
            
        }
    }
}
