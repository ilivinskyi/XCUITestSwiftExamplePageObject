//
//  WeatherModel.swift
//  SampleAppForXCUITest
//
//  Created by IL on 25.07.2022.
//

import Foundation

struct WeatherModel: Decodable, Hashable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}

struct Clouds: Decodable, Hashable {
    let all: Int
}

struct Coord: Decodable, Hashable {
    let lon, lat: Double
}

struct Main: Decodable, Hashable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike
        case tempMin
        case tempMax
        case pressure, humidity
    }
}

struct Sys: Decodable, Hashable {
    let country: String
    let sunrise, sunset: Double
}

struct Weather: Decodable, Hashable {
    let id: Int
    let main, description, icon: String
}

struct Wind: Decodable, Hashable {
    let speed: Double
    let deg: Int
}
