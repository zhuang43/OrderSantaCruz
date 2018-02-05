//
//  listCell.swift
//  ParseStarterProject-Swift
//
//  Created by huang on 10/31/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class listCell: UITableViewCell {

    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var price: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
