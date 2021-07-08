//
//  TableAddOnCell.swift
//  Premium Calculator
//
//  Created by softnotions on 05/09/20.
//  Copyright © 2020 softnotions. All rights reserved.
//

import UIKit


class TableAddOnCell: UITableViewCell {

    @IBOutlet weak var checkCommon: CheckBox!
    @IBOutlet weak var checkBox: CheckBox!
    @IBOutlet weak var lblAddOn: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
