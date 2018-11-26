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
    enum Condition: String {//weather conditions for the location that is pulled from the darksky api
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
      
        //Computed property that selects the icon based on the weather
        var icon: String {
            switch self {//if the case is .condition then it returns a icon basded on that condition (.clearDay = SunIcon)
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
    
    //required initalizer / Designated initializer
    init(temperature: Double, highTemperature: Double, lowTemperature : Double, condition: Condition) {
        self.condition = condition
        self.highTemperature = highTemperature
        self.lowTemperature = lowTemperature
        self.temperature = temperature

    }
    //convenience init
    //also parses JSON
    convenience init?(json:JSON) {
        guard let temperature = json[WeatherDataKeys.currently.rawValue][WeatherDataKeys.temperature.rawValue].double,
            let lowTemperature = json[WeatherDataKeys.daily.rawValue][WeatherDataKeys.data.rawValue][0][WeatherDataKeys.temperatureLow.rawValue].double,
            let highTemperature = json[WeatherDataKeys.daily.rawValue][WeatherDataKeys.data.rawValue][0][WeatherDataKeys.temperatureHigh.rawValue].double,
            let conditionString = json[WeatherDataKeys.currently.rawValue][WeatherDataKeys.icon.rawValue].string,
            let condition = Condition(rawValue: conditionString)
            else{
            return nil
        }
        self.init(temperature: temperature, highTemperature: highTemperature, lowTemperature: lowTemperature, condition: condition)
    }
}
