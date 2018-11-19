//
//  ViewController.swift
//  WeatherApp
//
//  Created by Zachary Harper on 11/14/18.
//  Copyright © 2018 Zachary Harper. All rights reserved.
//

import UIKit

class WeatherDisplayViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var iconLabel: UILabel!
    
    @IBOutlet weak var currentTempLabel: UILabel!
    
    @IBOutlet weak var highTempLabel: UILabel!
    
    @IBOutlet weak var lowTempLabel: UILabel!
    
    var displayWeatherData: WeatherData! {
        didSet {
            iconLabel.text = displayWeatherData.condition.icon
            currentTempLabel.text = "\(displayWeatherData.temperature)°"
            lowTempLabel.text = "\(displayWeatherData.lowTemperature)°"
            highTempLabel.text = "\(displayWeatherData.highTemperature)°"
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //lat
        let latitude = 36.862969
        
        let longitude = -85.670485
        
        APIManager.getWeather(at: (latitude , longitude)) {weatherData, error in
            if let recievedData = weatherData {
                self.displayWeatherData = recievedData
                print(recievedData)
            }
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}

