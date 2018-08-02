//
//  ChangeCityViewController.swift
//  WeatherApp
//
//  Created by Yusuf DEMİRKOPARAN on 2.08.2018.
//  Copyright © 2018 All rights reserved.
//

import UIKit



protocol weatetherUserEnteredCityName {
    func userEnteredCityName(cityName: String)
}


class ChangeCityViewController: UIViewController {
    
    
   
    var delegate : weatetherUserEnteredCityName?
    
 
    @IBOutlet weak var changeCityTextField: UITextField!

    
   
    @IBAction func getWeatherPressed(_ sender: AnyObject) {
        
        let city = String(changeCityTextField.text!)
        delegate?.userEnteredCityName(cityName: city)
        
        dismiss(animated: true, completion: nil)
        
        
    
        
    }
    
    

  
    @IBAction func backButtonPressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
