//
//  WeatherTableViewCell.swift
//  Weather App
//
//  Created by David Breskvar on 29/11/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var weatherCity: UILabel!
    @IBOutlet weak var weatherTemp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
