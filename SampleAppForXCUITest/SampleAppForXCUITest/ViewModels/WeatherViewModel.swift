//
//  WeatherViewModel.swift
//  SampleAppForXCUITest
//
//  Created by IL on 25.07.2022.
//

import SwiftUI

class WeatherViewModel: ObservableObject {
        
    @Published var isLoading = true
    @Published var errorMessage = ""
    @Published var currentCityWeather: WeatherModel?
    
    init() {
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=kyiv&units=metric&appid=13a3c533711ebeb908f2978a253937a0".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        guard let url = URL(string: urlString) else {
            self.isLoading = false
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                
                if let statusCode = (resp as? HTTPURLResponse)?.statusCode,
                   statusCode >= 400 {
                    self.isLoading = false
                    self.errorMessage = "Bad status: \(statusCode)"
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    self.currentCityWeather = try decoder.decode(WeatherModel.self, from: data)

                    
                } catch {
                    print("Failed to decode JSON:", error)
                    self.errorMessage = error.localizedDescription
                }
                
                self.isLoading = false
            }
        }.resume()
        
        
    }
}

