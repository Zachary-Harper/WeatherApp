//
//  SearchViewController.swift
//  WeatherApp
//
//  Created by Zachary Harper on 11/15/18.
//  Copyright © 2018 Zachary Harper. All rights reserved.
//

import UIKit

class LocationSearchViewController: UIViewController, UISearchBarDelegate{

    let apiManager = APIManager()
    
    var geocodingData: GeocodingData?
    var weatherData: WeatherData?
    
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self

        
        
        // Do any additional setup after loading the view.
    }
    
    func handleError() {
        geocodingData = nil
        weatherData = nil
        
    }
    
    func getGeocodingData(searchAddress: String) {
        apiManager.geocode(address: searchAddress) {
            (geocodingData ,error) in 
            if let receivedError = error {
                print(receivedError.localizedDescription)
                self.handleError()
                return
            }
            
            if let recievedData = geocodingData {
                self.geocodingData = recievedData
                
                self.retrieveWeatherData(latitude: recievedData.latitude, longitude: recievedData.longitude)
            } else {
                self.handleError()
                return
            }
        }
    }
        func retrieveWeatherData(latitude: Double, longitude: Double){
            
            apiManager.getWeather(at: (latitude, longitude)) {(weatherData, error) in
                if let recievedError = error {
                    print(recievedError.localizedDescription)
                    self.handleError()
                    return

                }
                
                if let recievedData = weatherData {
                    self.weatherData = recievedData
                    self.performSegue(withIdentifier: "unwindToWeatherDisplay", sender: self)
                } else {
                    
                    self.handleError()
                    return
                }
            }
        }
    
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
            guard let searchAddress = searchBar.text?.replacingOccurrences(of: " ", with: "+") else {
                return
            }
            getGeocodingData(searchAddress: searchAddress)
        }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? WeatherDisplayViewController,
        let recievedGeocodingData = geocodingData,
            let recievedWeatherData = weatherData {
            destinationVC.displayWeatherData = recievedWeatherData
            destinationVC.displayGeocodingData = recievedGeocodingData
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
