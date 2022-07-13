//
//  WeatherViewController.swift
//  Weather App
//
//  Created by Efe on 11.07.2022.
//

import UIKit

class WeatherViewController: UIViewController {

    let decoder = JSONDecoder()
    var networkWeatherManager = WeatherNetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkWeatherManager.fetchCurrentWeather(forCity: "Toronto")
    }

    }

extension WeatherViewController {
    
    func showWeatherCorrectly(forCity city : String) {
        
        
    }
    
}
    
