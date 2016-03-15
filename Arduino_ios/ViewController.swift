//
//  ViewController.swift
//  Arduino_ios
//
//  Created by 澤井聖也 on 2016/03/14.
//  Copyright © 2016年 澤井聖也. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WeatherServiceDelegate {
   
    
    let weatherService = WeatherService()
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityButton: UIButton!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var cloudsLabel: UILabel!
    @IBOutlet weak var rainLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func setCityTapped(sender: UIButton) {
        
        print("City Button Tapped")
        openCityAlert()
    }
    
    func openCityAlert(){
        let alert = UIAlertController(title: "City", message: "Enter City Name", preferredStyle: UIAlertControllerStyle.Alert)
        
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        
        alert.addAction(cancel)
        
        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (action: UIAlertAction) -> Void in
            print("OK")
            let textField = alert.textFields?[0]
            // print(textField?.text!)
            // self.cityLabel.text = textField?.text
            let cityName = textField?.text!
            self.weatherService.getWeather(cityName!)
            
        }
        
        alert.addAction(ok)
        
        // Add text Field
        alert.addTextFieldWithConfigurationHandler { (textField: UITextField) -> Void in
            textField.placeholder = "City Name"
        }
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    // Weather Service  Delegate
    
    func setWeather(weather: Weather) {
//        print(" *** Set Weather")
//        print("City: \(weather.cityName)  temp: \(weather.temp) desc: \(weather.description)")
      
//        cityLabel.text = weather.cityName
        tempLabel.text = "\(weather.tempC)°"
        descriptionLabel.text = weather.description
        cityButton.setTitle(weather.cityName, forState: UIControlState.Normal)
        iconImage.image = UIImage(named: weather.icon)
        cloudsLabel.text = "Clouds:\(weather.clouds)%"
        rainLabel.text = "Percipitation:\(weather.rain)%"
        tempMinLabel.text = "tempMin:\(weather.minTempC)°"
        tempMaxLabel.text = "tempMax:\(weather.maxTempC)°"
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.weatherService.delegate = self
        setLayout()
        scrollView.contentSize = CGSizeMake(2000, 325)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func setLayout (){
        UITabBar.appearance().barTintColor = UIColor.clearColor()
           }

}

