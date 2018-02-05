//
//  ItemCell.swift
//  ParseStarterProject-Swift
//
//  Created by huang on 10/30/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit



class ItemCell: UITableViewCell {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var add: UIButton!
    
    
    

    override func awakeFromNib() {
    
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
