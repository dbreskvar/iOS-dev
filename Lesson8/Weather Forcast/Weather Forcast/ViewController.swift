//
//  ViewController.swift
//  Weather Forcast
//
//  Created by David Breskvar on 05/11/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var city_name : String = "Ljubljana"
    var country_code : String = "SI"
    var image_code : String = "01d"
    var api_url : String?
    var img_url : String?
    
    var index = 7

    @IBOutlet var customView: WeatherView!
    @IBOutlet var locationText: UILabel!
    @IBOutlet var temperatureText: UILabel!
    @IBOutlet var locationImg: UIImageView!
    
    @IBAction func nextCity(sender: AnyObject) {
        if (index + 1) < cities.count {
            index++
        } else {
            index = 0
        }
        
        changeCity(index)
    }
    
    var cities = ["Ljubljana, SI", "London, UK", "Phoenix, AZ", "Vienna, AT", "Berlin, DE", "Paris, FR", "Athens, GR", "San Francisco, CA"]
    var weathers = [WeatherStatus.Rainy, WeatherStatus.Showers, WeatherStatus.Sunny, WeatherStatus.Snowy,
                    WeatherStatus.Partly_cloudy, WeatherStatus.Cloudy, WeatherStatus.Clear_night, WeatherStatus.Sunny]
    var temperatures = ["13°C", "8°C", "23°C", "11°C", "10°C", "17°C", "31°C", "13°C"]
    var image_strings = ["ljubljana", "london", "phoenix", "wien", "berlin", "paris", "athens", "sf_background"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        api_url = "api.openweathermap.org/data/2.5/weather?q=\(city_name),\(country_code)"
        img_url = "http://openweathermap.org/img/w/\(image_code).png"
        
        let test_url = NSURL(string: "https://www.stackoverflow.com")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(test_url!) {
            (data, response, error) in
            if error == nil {
                
                var url_content = NSString(data: data!, encoding: NSUTF8StringEncoding)
                //print(url_content)
            } else {
                print("error \(error?.code) ")
            }
        }
        
        task.resume()
        
        customView.setImageView(WeatherStatus.Sunny)
        doCoolAnimations()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func doCoolAnimations() {
        let original_frame = locationText.frame.origin
        let temp_original_frame = temperatureText.frame.origin
        
        customView.alpha = 0
        
        locationText.frame.origin.x = 0
        temperatureText.frame.origin.y = 0
        
        UIView.animateWithDuration(1.5) { () -> Void in
            self.locationText.frame.origin = original_frame
            self.temperatureText.frame.origin = temp_original_frame
            self.customView.alpha = 1
            
            self.locationText.transform = CGAffineTransformIdentity
        }

    }
    
    func changeCity(i : Int) {
        locationImg.image = UIImage(named: image_strings[i])
        locationText.text = cities[i]
        temperatureText.text = temperatures[i]
        customView.setImageView(weathers[i])
        doCoolAnimations()
    }

}

