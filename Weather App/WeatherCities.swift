//  WeatherCities.swift
//  Weather App
//  Created by Efe on 11.07.2022.

import Foundation

var tableView = ViewController()

struct WeatherCities :  Codable {
    let name : String
    let weather: [Weather]
    let main : Main
}

struct Weather : Codable {
    let id: Int
}

struct Main : Codable {
    let temp, feelsLike : Double
    
    enum CodingKeys : String, CodingKey {
        case temp
        case feelsLike = "feels_like"
    }
}

struct WeatherNetworkManager {
    
    //MARK: Retrive API from Server. The End :D
    func fetchCurrentWeather (forCity city : String) {
        let usrlString = "http://api.openweathermap.org/data/2.5/weather?q=Toronto&appid=94e5ac1b15ed419b46d962b3e3840604"
        
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
            let currentWeatherDate = try decoder.decode(WeatherCities.self, from: data)
            print(currentWeatherDate.main.temp)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
