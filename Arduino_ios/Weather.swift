//
//  Weather.swift
//  Arduino_ios
//
//  Created by 澤井聖也 on 2016/03/14.
//  Copyright © 2016年 澤井聖也. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Weather {
    let cityName: String
    let temp: Double
    let description: String
    let icon: String
    let clouds : Double
    let rain: Double
    let maxTemp: Double
    let minTemp: Double
    
    var tempC: Int{
        get {
            return Int(temp - 273.15)
        }
        
    }
    var maxTempC: Int{
        get {
            return Int(maxTemp - 273.15)
        }
    }
    var minTempC: Int{
        get{
            return Int(minTemp - 273.15)
        }
    }
    
    init(cityName: String, temp: Double, description: String , icon: String, clouds: Double, rain: Double, maxTemp: Double, minTemp: Double) {
        self.cityName  = cityName
        self.temp = temp
        self.description = description
        self.icon = icon
        self.clouds = clouds
        self.rain = rain
        self.maxTemp = maxTemp
        self.minTemp = minTemp
    }
}
