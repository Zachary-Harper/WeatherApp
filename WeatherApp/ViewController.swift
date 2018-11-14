//
//  ViewController.swift
//  WeatherApp
//
//  Created by Zachary Harper on 11/14/18.
//  Copyright © 2018 Zachary Harper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let latitude = 36.9959
        
        let longitude = 85.9119
        
        APIManager.getWeather(at: (latitude , longitude)) {value, error in
            guard let value = value else {
               if let error = error {
                print(error.localizedDescription)
               } else {
                print("Sorry No Error Description")
                }
                self.view.backgroundColor = .red
                return
                
            }
            print(value)
            self.view.backgroundColor = .green
        }
        
        
    }
    
    
    


}

