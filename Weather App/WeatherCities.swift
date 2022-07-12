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
