//
//  WeatherTableViewController.swift
//  Weather App
//
//  Created by David Breskvar on 29/11/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import UIKit
import Alamofire

class WeatherTableViewController: UITableViewController {
    
    var APP_ID : String = "d09783c4db690701329610aa537ab60e"
    
    var helper = Manager.manager

    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        refreshControl!.addTarget(self, action: "refreshData", forControlEvents: .ValueChanged)
        
        let city1 = Weather(id: 2653822, name: "Cardiff,GB")
        city1.temperature = 8.43
        let city2 = Weather(id: 5391959, name: "San Francisco,US")
        city2.temperature = 26.7
        let city3 = Weather(id: 2643743, name: "London,GB")
        city3.temperature = 9.75
        let city4 = Weather(id: 3196359, name: "Ljubljana,SI")
        city4.temperature = -1.74
        let city5 = Weather(id: 5128581, name: "New York,US")
        city5.temperature = 13.66
        let city6 = Weather(id: 1273294, name: "Delhi,IN")
        
        helper.cities.append(city1)
        helper.cities.append(city2)
        helper.cities.append(city3)
        helper.cities.append(city4)
        helper.cities.append(city5)
        helper.cities.append(city6)
        //getDetailedWeather("Ljubljana")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        if self.tableView.numberOfRowsInSection(0) < helper.cities.count {
            self.tableView.reloadData()
            print("table is refreshed")
        }
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return helper.cities.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("weatherRow", forIndexPath: indexPath) as! WeatherTableViewCell

        cell.weatherCity.text = helper.cities[indexPath.row].name
        if let temp = helper.cities[indexPath.row].temperature {
            cell.weatherTemp.text = "\(temp) °C"
        } else {
            cell.weatherTemp.text = "N/A"
        }
       
        return cell
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        print("started a segue")
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("selected row at index path: \(indexPath)")
    }
    
    func refreshData() {
        //updateCities(helper.cities)
        getCitiesAlamo(helper.cities)
        //refreshControl!.endRefreshing()
        //tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            helper.cities.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    func getCitiesAlamo(cities : [Weather]) {
        
        var cityName : String?
        var cityTemp : Double?
        var cityIcon : String?
        var cityID : Int?
        var updatedCities : [Weather] = [Weather]()
        
        var ids : String = ""
        for var i = 0; i < cities.count; i++ {
            if i == 0 {
                ids += "\(cities[i].id)"
            } else {
                ids += ",\(cities[i].id)"
            }
        }
        
        var url : String = "http://api.openweathermap.org/data/2.5/group?id=\(ids)&units=metric&appid=\(APP_ID)"
        url = url.stringByReplacingOccurrencesOfString(" ", withString: "+")
        
        Alamofire.request(.GET, url).responseJSON
            { response in
                
                if let JSON = response.result.value {
                    
                    if let objects = JSON["list"] as? [AnyObject] {
                        for var x = 0; x < objects.count; x++ {
                            //This will loop through every city saved in TableView
                            if let name = objects[x]["name"] as? String {
                                cityName = name
                                if let sys = objects[x]["sys"] as? [String : AnyObject] {
                                    if let country = sys["country"] as? String {
                                        cityName = "\(cityName!),\(country)"
                                    }
                                }
                            } else {
                                cityName = "Unknown city"
                            }
                            if let temperature = objects[x]["main"] as? [String : AnyObject] {
                                if let temp = temperature["temp"] as? Double {
                                    cityTemp = temp
                                }
                            }
                            if let desc = objects[x]["weather"] as? [AnyObject] {
                                if desc.count > 0 {
                                    if let firstDesc = desc[0] as? [String : AnyObject] {
                                        if let icon = firstDesc["icon"] as? String {
                                            cityIcon = icon
                                        }
                                    }
                                }
                            }
                            if let id = objects[x]["id"] as? Int {
                                cityID = id
                            } else {
                                cityID = -1
                            }
                            //save all cities again here? Update data?
                            let city : Weather = Weather(id: cityID!, name: cityName!)
                            city.icon = cityIcon
                            city.temperature = cityTemp
                            updatedCities.append(city)
                        }
                        self.helper.cities = updatedCities
                        
                        dispatch_async(dispatch_get_main_queue(), {
                            self.tableView.reloadData()
                            self.refreshControl!.endRefreshing()
                        })
                        
                    }

                }
            }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
