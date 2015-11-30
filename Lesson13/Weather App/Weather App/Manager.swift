//
//  Manager.swift
//  Weather App
//
//  Created by David Breskvar on 30/11/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import Foundation

class Manager : NSObject {
    static let manager = Manager()
    var APP_ID : String = "d09783c4db690701329610aa537ab60e"
    
    var cities : [Weather] = [Weather]()
    
    func loadCities () {
        let city1 = Weather(id: 2653822, name: "Cardiff, GB")
        city1.temperature = 8.43
        let city2 = Weather(id: 5391959, name: "San Francisco, US")
        city2.temperature = 26.7
        let city3 = Weather(id: 2643743, name: "London, GB")
        city3.temperature = 9.75
        let city4 = Weather(id: 3196359, name: "Ljubljana, SI")
        city4.temperature = -1.74
        let city5 = Weather(id: 5128581, name: "New York, US")
        city5.temperature = 13.66
        let city6 = Weather(id: 1273294, name: "Delhi, IN")
        
        cities.append(city1)
        cities.append(city2)
        cities.append(city3)
        cities.append(city4)
        cities.append(city5)
        cities.append(city6)

    }
    
    func addCity(name : String?, id : Int?) {
        var city : Weather?
        var url : String = ""
        if let name = name {
            url = "http://api.openweathermap.org/data/2.5/weather?q=\(name)&units=metric&appid=\(APP_ID)"
        } else if let id = id {
            url = "http://api.openweathermap.org/data/2.5/weather?id=\(id)&units=metric&appid=\(APP_ID)"
        }
        url = url.stringByReplacingOccurrencesOfString(" ", withString: "+")
        let request = NSMutableURLRequest()
        request.URL = NSURL(string: url)
        request.HTTPMethod = "GET"
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            var name : String?
            
            if let data = data {
                do {
                    let object = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0))
                    if let response = object as? [String : AnyObject] {
                        if let jID = response["id"] as? Int {
                            if let jName = response["name"] as? String {
                                if let sys = response["sys"] as? [String : AnyObject] {
                                    if let jCountry = sys["country"] as? String {
                                        name = "\(jName), \(jCountry)"
                                    }
                                }
                            } else {
                                name = "Unknown city"
                            }
                            city = Weather(id: jID, name: name!)
                        }
                        
                        if let weather = response["weather"] as? [String : AnyObject] {
                            if let icon = weather["icon"] as? String {
                                //Add an icon here
                            }
                        }
                        if let info = response["main"] as? [String : AnyObject] {
                            if let temp = info["temp"] as? Double {
                                city?.temperature = temp
                            }
                        }
                        
                    }
                    print("City with the name of \(name!) was added")
                    self.cities.append(city!)
                    
                } catch {
                    print("Unable to find a city")
                }
            }
        }
        
        task.resume()
    }
}
















