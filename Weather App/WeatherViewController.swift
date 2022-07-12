//
//  WeatherViewController.swift
//  Weather App
//
//  Created by Efe on 11.07.2022.
//

import UIKit

class WeatherViewController: UIPageViewController {

    let sessionConfiguration = URLSessionConfiguration.default
   final let session = URLSession.shared
    let decoder = JSONDecoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        workWithWeather()

    }
    
    func workWithWeather() {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/3.0/onecall?lat=43.651070&lon=-79.347015&exclude=current&appid=3de81134da5a686cfd7c165a2b28776c") else {return}
        session.dataTask(with: url) { data, urlResponse, error in
            
            if error == nil, let weatherPost = data {

                let post = try? self.decoder.decode([WeatherCities].self, from: weatherPost)
                
            }
            else {

                print("Error: \(error)")
            }
        }.resume()

        
    }
    
    }
    
