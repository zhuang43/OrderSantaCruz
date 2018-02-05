//
//  sellersProfileCell.swift
//  ParseStarterProject-Swift
//
//  Created by huang on 10/27/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class sellersProfileCell: UITableViewCell {

    @IBOutlet weak var sellerName: UILabel!

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var profilePhoto: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
