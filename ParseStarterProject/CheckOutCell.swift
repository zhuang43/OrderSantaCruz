//
//  CheckOutCell.swift
//  ParseStarterProject-Swift
//
//  Created by huang on 10/31/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class CheckOutCell: UITableViewCell {
    @IBOutlet weak var address1: UITextField!
    @IBOutlet weak var address2: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var totalPrice: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
