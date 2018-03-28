//
//  NetworkingServices.swift
//  sampleMVCApp
//
//  Created by Bmsils on 09/11/17.
//  Copyright © 2017 Bmsils. All rights reserved.
//

import Foundation

class NetworkingServices{
    private init(){}
    static let shared = NetworkingServices()
    
    func getData(fromUrl url:URL, completion: @escaping (Any) -> Void){
        let session = URLSession.shared
        let task = session.dataTask(with: url){(data, respons, error) in
            guard let data = data else{return}
            do{
               let json = try JSONSerialization.jsonObject(with: data, options:[]) as? [String: Any]
                guard let result = json?["hits"] else{return}
                DispatchQueue.main.async {
                     completion(result as Any)
                }
            }catch {}
        }
        task.resume()
    }
}
