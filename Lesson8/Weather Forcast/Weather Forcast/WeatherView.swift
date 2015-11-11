//
//  WeatherView.swift
//  Weather Forcast
//
//  Created by David Breskvar on 11/11/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import UIKit

class WeatherView: UIView {
    
    var status : String = "sunny"
    var image : UIImageView?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        image = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        if let image = image {
            image.image = UIImage(named: status)
            self.backgroundColor = UIColor(white: 1, alpha: 0)
            addSubview(image)
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    func setImageView(image : UIImageView, status : WeatherStatus) {
        switch status {
        case .Cloudy:
            image.image = UIImage(named: "cloudy")
            break
        case .Partly_cloudy:
            image.image = UIImage(named: "partly_cloudy")
            break
        case .Rainy:
            image.image = UIImage(named: "rainy")
            break
        case .Sunny:
            image.image = UIImage(named: "sunny")
            break
        case .Thunderstorms:
            image.image = UIImage(named: "thunderstorms")
            break
        case .Snowy:
            image.image = UIImage(named: "snowy")
            break
        case .Showers:
            image.image = UIImage(named: "showers")
            break
        case .Clear_night:
            image.image = UIImage(named: "clear_night")
            break
        }
    }
}