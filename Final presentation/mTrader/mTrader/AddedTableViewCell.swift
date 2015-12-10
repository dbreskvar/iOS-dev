//
//  AddedTableViewCell.swift
//  mTrader
//
//  Created by David Breskvar on 09/12/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import UIKit

class AddedTableViewCell: UITableViewCell {

    @IBOutlet weak var addedName: UILabel!
    @IBOutlet weak var addedMobile: UILabel!
    @IBOutlet weak var addedPrice: UITextView!
    @IBOutlet weak var addedDefaultCurrency: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
