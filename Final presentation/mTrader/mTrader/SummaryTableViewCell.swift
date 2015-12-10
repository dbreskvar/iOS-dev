//
//  SummaryTableViewCell.swift
//  mTrader
//
//  Created by David Breskvar on 09/12/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import UIKit

class SummaryTableViewCell: UITableViewCell {

    @IBOutlet weak var summaryName: UILabel!
    @IBOutlet weak var summaryPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
