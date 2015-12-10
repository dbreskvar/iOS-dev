//
//  CityInfoViewController.swift
//  Weather App
//
//  Created by David Breskvar on 30/11/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import UIKit

class CityInfoViewController: UIViewController {
    
    var APP_ID : String = "d09783c4db690701329610aa537ab60e"
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var winds: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var weatherDesc: UITextView!
    
    override func viewDidLoad() {
        
    }
    
    override func viewDidAppear(animated: Bool) {
        getDetailedWeather("Ljubljana")
    }

    func getDetailedWeather(name : String) {
        
        print("I started a request")
        
        let request = NSMutableURLRequest()
        var url : String = "http://api.openweathermap.org/data/2.5/weather?q=\(name)&units=metric&appid=\(APP_ID)"
        url = url.stringByReplacingOccurrencesOfString(" ", withString: "+")
        request.URL = NSURL(string: url)
        request.HTTPMethod = "GET"
        
        print("URL is in session \(url)")
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            var name : String?
            var id : UInt?
            var mainWeather : String?
            var description : String?
            var icon : String?
            var temp : Double?
            var humidity : UInt?
            var country : String?
            var windSpeed : Double?
            
            if let data = data {
                do {
                    print("Well I'm doing something alright...")
                    let object = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0))
                    
                    if let dictionary = object as? [String : AnyObject] {
                        if let weather = dictionary["weather"] as? [AnyObject] {
                            if weather.count > 0 {
                                if let first = weather[0] as? [String : AnyObject] {
                                    mainWeather = first["main"] as? String
                                    description = first["description"] as? String
                                    icon = first["icon"] as? String
                                }
                            }
                        }
                        if let main = dictionary["main"] as? [String : AnyObject] {
                            temp = main["temp"] as? Double
                            humidity = main["humidity"] as? UInt
                        }
                        if let system = dictionary["sys"] as? [String : AnyObject] {
                            country = system["country"] as? String
                        }
                        if let winds = dictionary["wind"] as? [String : AnyObject] {
                            windSpeed = winds["speed"] as? Double
                        }
                        name = dictionary["name"] as? String
                        id = dictionary["id"] as? UInt
                        
                        print("City: \(name!), \(country!) weather: \(mainWeather!) description: \(description!) temp: \(temp!) humidity: \(humidity!)% with ID: \(id!) and icon: \(icon!)")
                        dispatch_async(dispatch_get_main_queue(), {
                            if let name = name, country = country, weather = description, temperature = temp, humidity = humidity, winds = windSpeed {
                                self.name.text = "\(name),\(country)"
                                self.weatherDesc.text = weather
                                self.temp.text = "\(temperature) °C"
                                self.humidity.text = "\(humidity)%"
                                self.winds.text = "\(winds) m/s"
                            }
                        })
                        
                    }
                } catch {
                    print("Something went wrong, probably permissions")
                }
            }
        }
        
        task.resume()
    }

}
