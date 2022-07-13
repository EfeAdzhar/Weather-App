//
//  WeatherCities.swift
//  Weather App
//
//  Created by Efe on 11.07.2022.
//

import Foundation


struct WeatherCities :  Codable {
    let location : [String]
    let current : [String]
    
    enum CodingCases : String, CodingKey {
        case location
        case current
    }
}

struct WeatherNetworkManager {
    
    //MARK: Retrive API from Server. The End :D
    func fetchCurrentWeather (forCity city : String) {
        let usrlString = "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=94e5ac1b15ed419b46d962b3e3840604"
        
        guard let url = URL(string: usrlString) else {return}
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, urlResponse, error in
            if let data = data {
               parseJSON(data: data)
            }
      
        }
        task.resume()
    }
    
    //MARK: To parse JSON from Server :)
    func parseJSON(data : Data) {
        let decoder = JSONDecoder()
        do {
            let shotoTamto = try decoder.decode(WeatherCities.self, from: data)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
            
        }
}
