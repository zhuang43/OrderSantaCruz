//
//  sellerCell.swift
//  ParseStarterProject-Swift
//
//  Created by huang on 10/29/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class sellerCell: UITableViewCell {

    @IBOutlet var openLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var sellerName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
