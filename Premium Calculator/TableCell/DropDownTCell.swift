//
//  DropDownTCell.swift
//  Premium Calculator
//
//  Created by softnotions on 03/09/20.
//  Copyright © 2020 softnotions. All rights reserved.
//

import UIKit

class DropDownTCell: UITableViewCell {
    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var lblContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
