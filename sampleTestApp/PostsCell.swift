//
//  PostsTableViewCell.swift
//  sampleMVCApp
//
//  Created by Bmsils on 09/11/17.
//  Copyright © 2017 Bmsils. All rights reserved.
//

import UIKit
protocol postCelldelegate {
    func toggleSection(row: Int)
}
class PostsCell: UITableViewCell {

    var delegate:postCelldelegate?
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var `switch`: UISwitch!
    var cellId:Int = 0
    
    func configure(withPost post:Post) -> Void {
        title.text = post.title
        createdLabel.text = post.body
        self.backgroundColor = post.selected ? UIColor(red: 243/255.0, green: 99/255, blue: 121/255, alpha: 1.0) : UIColor.clear
        self.switch.isOn = post.selected
        
    }
    @IBAction func switchAction(_ sender: Any) {
        delegate?.toggleSection(row: cellId)
        
    }
}
