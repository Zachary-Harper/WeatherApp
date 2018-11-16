//
//  weatherData.swift
//  WeatherApp
//
//  Created by Zachary Harper on 11/16/18.
//  Copyright © 2018 Zachary Harper. All rights reserved.
//

import UIKit
import SwiftyJSON

class WeatherData {
    enum Condition: String {
        case clearDay = "clear-day"
        case clearNight = "clear-night"
        case rain = "rain"
        case snow = "snow"
        case sleet = "sleet"
        case wind = "wind"
        case fog = "fog"
        case cloudy = "cloudy"
        case partlyCloudyDay = "partly-cloudy-day"
        case partlyCloudyNight = "partly-cloudy-night"
      
        //Conputed property that selects the icon based on the weather
        var icon: String {
            switch self {
            case .clearDay:
                return "🌞"
            case .clearNight:
                return "🌚"
            case .rain:
                return "☔️"
            case .snow:
                return "☃️"
            case .sleet:
                return "🦔"
            case .wind:
                return "🌬"
            case .fog:
                return "🌫"
            case .cloudy:
                return "☁️"
            case .partlyCloudyDay:
                return "🌥"
            case .partlyCloudyNight:
                return "🐉"
            default:
                break
            }
        }
    }
    
    enum WeatherDataKeys: String{
        case currently = "currently"
        case temperature = "temperature"
        case icon = "icon"
        case daily = "daily"
        case data = "data"
        case temperatureHigh = "temperatureHigh"
        case temperatureLow = "temperatureLow"
        
    }
    
    let temperature: Double
    let highTemperature: Double
    let lowTemperature: Double
    let condition: Condition
    
    //required initalizer
    init(temperature: Double, highTemperature: Double, lowTemperature : Double, condition: Condition) {
        self.condition = condition
        self.highTemperature = highTemperature
        self.lowTemperature = lowTemperature
        self.temperature = temperature

    }
}
