//
//  WeatherService.swift
//  Arduino_ios
//
//  Created by 澤井聖也 on 2016/03/14.
//  Copyright © 2016年 澤井聖也. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol WeatherServiceDelegate {
    func setWeather(weather: Weather)
}

class WeatherService {
    
    var delegate : WeatherServiceDelegate?
    
    func getWeather(city: String) {
       
        let cityEscaped = city.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())
        let appid = "b1b15e88fa797225412429c1c50c122a"
        let past = "4e2f31a2b618cfd68f8885be80905898"
        
        let path = "http://api.openweathermap.org/data/2.5/weather?q=\(cityEscaped!)&appid=\(past)"
        let url = NSURL(string: path)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data: NSData?,  response: NSURLResponse?, error: NSError?) -> Void in
            
            let json = JSON(data: data!)
            let lon = json["coord"]["lon"].double
            let lat = json["coord"]["lat"].double
            let temp = json["main"]["temp"].double
            let name = json["name"].string
            let desc = json["weather"][0]["description"].string
            let icon = json["weather"][0]["icon"].string
            let clouds = json["clouds"]["all"].double
            let rain = json["main"]["humidity"].double
            let maxTemp = json["main"]["temp_max"].double
            let minTemp = json["main"]["temp_min"].double
            
            let weather = Weather(cityName: name!, temp: temp!, description: desc!, icon: icon!, clouds: clouds!, rain: rain!, maxTemp: maxTemp!, minTemp: minTemp!)
            
            
            if self.delegate != nil{
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.delegate?.setWeather(weather)

                })
                
            }
            print("lon :\(lon!) lat :\(lat!) temp :\(temp!)")
            
            //print("->   \(data)")
        
        }
        
        task.resume()
        // request weather Data
       // print("Weather Service city: \(city)")
       
        /* let weather = Weather(cityName: city, temp: 237.72, description: "A nice day")
        
        if delegate != nil{
            delegate?.setWeather(weather)
        }
*/
    }
    
}