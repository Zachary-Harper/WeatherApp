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
    
    var displayGeocodingData : GeocodingData! {
        didSet {
            locationLabel.text = displayGeocodingData.formattedAddress
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //lat
       setupDefaultUI()
    }
    
    
    func setupDefaultUI() {
        
        locationLabel.text = ""
        iconLabel.text = "🐡"
        currentTempLabel.text = "Enter Location"
        highTempLabel.text = "-"
        lowTempLabel.text = "-"
        
    }
    @IBAction func unwindToWeatherDisplay(segue: UIStoryboardSegue){
        
    }
}

