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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //lat
        let latitude = 85.9119
        
        let longitude = 36.9959
        
        APIManager.getWeather(at: (latitude , longitude)) {value, error in
            guard let value = value else {
               if let error = error {
                print(error.localizedDescription)
               } else {
                print("Sorry No Error Description")
                }
                return
                
            }
            print(value)
        }
    }
}

