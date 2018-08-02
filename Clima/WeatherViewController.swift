//
//  ViewController.swift
//  WeatherApp
//
//  Created by Yusuf DEMİRKOPARAN on 2.08.2018.
//  Copyright © 2018 All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON



class WeatherViewController: UIViewController, CLLocationManagerDelegate,weatetherUserEnteredCityName {
    
    
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "e13dea1c5038c0d14b6537a253b1042f"
    let locationManager = CLLocationManager()
    let weatherData = WeatherDataModel()
    var degree = 0
    
   
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
     
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
    }
    
    
    
    //MARK: - Networking
    /***************************************************************/
    
    func getWeatherData(url: String, parameters: [String: String]){
        
        
        
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON { (response) in
            if response.result.isSuccess {
                let weatherJSON : JSON =  JSON(response.result.value!)
                print(weatherJSON)
                self.updateWeatherData(json: weatherJSON)
                
            } else {
                print("\(String(describing: response.result.error))")
                
            }
        }
        
    }
    
    
    
    
    
    //MARK: - JSON Parsing
    /***************************************************************/
   
    
    
    func  updateWeatherData(json: JSON) {
        if let temp = json["main"]["temp"].double {
            weatherData.temperature = Int(temp - 273.15)
            degree = weatherData.temperature
            weatherData.condition = json["weather"][0]["id"].intValue
            weatherData.city = json["name"].stringValue
            weatherData.weatherIconName = weatherData.updateWeatherIcon(condition: weatherData.condition)
            updateUIWithWeatherData()
        }else {
            cityLabel.text = "Weather Unaviablable"
        }
    }

    
    
    
    //MARK: - UI Updates
    /***************************************************************/
    
    
   
    func updateUIWithWeatherData() {
        
        cityLabel.text = weatherData.city
        temperatureLabel.text = "\(weatherData.temperature)°"
        weatherIcon.image = UIImage(named: weatherData.weatherIconName  )
        
       
    }
    
    
    
    
    
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count-1]
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            let params : [String: String] = ["lat": latitude, "lon": longitude, "appid": APP_ID ]
            getWeatherData(url: WEATHER_URL, parameters: params)
        }
    }
    
  
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    
        print("Connection Issues ")
        
    }
    
    
    func userEnteredCityName(cityName: String) {
        print(cityName)
        let params : [String: String] = ["q": cityName, "appid": APP_ID]
        getWeatherData(url: WEATHER_URL, parameters: params)
    }

    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeCityName" {
            let destinationVC = segue.destination as! ChangeCityViewController
            destinationVC.delegate = self
            
        }
    }
    
   
    
      
    //    MARK: Change Degree
    /***************************************************************/
    
    @IBAction func degreeClick(_ sender: UIButton) {
        if sender.tag == 1 {
            let  fahrenheit = ((9/5)*degree+32)
            temperatureLabel.text = "\(fahrenheit)°"
          
        } else if sender.tag == 2 {
             temperatureLabel.text = "\(degree)°"
        }
        
    }
    
    
    
    
}


