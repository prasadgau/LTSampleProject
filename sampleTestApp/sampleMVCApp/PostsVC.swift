//
//  ViewController.swift
//  sampleMVCApp
//
//  Created by Bmsils on 09/11/17.
//  Copyright © 2017 Bmsils. All rights reserved.
//

import UIKit

class PostsVC: UIViewController,postCelldelegate {
    @IBOutlet weak var sampleTableView: UITableView!
      var posts = [Post]()
    var count : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Selected posts \(count)"
        let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        myActivityIndicator.center = view.center
        myActivityIndicator.hidesWhenStopped = false
        myActivityIndicator.startAnimating()
        view.addSubview(myActivityIndicator)
        
        PostNetworking.getPosts { (response) in
            let posts = response.posts
            self.posts = posts
            myActivityIndicator.stopAnimating()
            myActivityIndicator.removeFromSuperview()
            self.sampleTableView.reloadData()
        }
    }
}


extension PostsVC:UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postsCell") as? PostsCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        let post = posts[indexPath.row]
        cell.configure(withPost: post)
        cell.cellId = indexPath.row
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        self.toggleSection(row: indexPath.row)
    }
    
    func toggleSection(row: Int)
    {
        let collapsed = !posts[row].selected
        posts[row].selected = collapsed
        if posts[row].selected == true {
            count = count + 1
        }
        else{
            count = count - 1
        }
        self.title = "Selected posts \(count)"
        sampleTableView.beginUpdates()
        let index:IndexPath = IndexPath(row: row, section: 0)
        sampleTableView.reloadRows(at: [index], with: .automatic)
        sampleTableView.endUpdates()
        
    }
    
}

