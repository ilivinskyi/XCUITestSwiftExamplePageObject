//
//  WeatherView.swift
//  SampleAppForXCUITest
//
//  Created by Ihor Livinskyi on 25.07.2022.
//

import SwiftUI

struct WeatherView: View {
    
    @ObservedObject private var vm: WeatherViewModel
    
    init() {
        self.vm = .init()
    }
    
    func getDateStringFromUnixTime(date: Double) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: Date(timeIntervalSince1970: date))
    }
    
    var body: some View {
        
        if let weather = vm.currentCityWeather {
            
            if !vm.errorMessage.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "xmark.octagon.fill")
                        .font(.system(size: 64, weight: .semibold))
                        .foregroundColor(.red)
                    Text(vm.errorMessage)
                }
            }
            
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: GenerateColorPairForGradient(weather: weather.weather[0].main)), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack {
                        VStack(alignment: .center) {
                            LottieView(name: weather.weather[0].main, loopMode: .loop)
                                .frame(width: 200, height: 200)
                            Text(weather.name)
                                .foregroundColor(Color(.white))
                                .font(.system(size: 25, weight: .light))
                                .accessibilityIdentifier("cityNameLabel")
                            Text("  \(String(Int(weather.main.temp)))°")
                                .foregroundColor(Color(.white))
                                .font(.system(size: 150, weight: .light))
                                .accessibilityIdentifier("temparatureLabel")
                            Text("Feels like \(String(Int(weather.main.feelsLike)))°")
                                .foregroundColor(Color(.white))
                                .font(.system(size: 15, weight: .light))
                                .accessibilityIdentifier("feelsLikeLabel")
                            Text(weather.weather[0].main)
                                .foregroundColor(Color(.white))
                                .font(.system(size: 15, weight: .light))
                                .accessibilityIdentifier("weatherConditionsLabel")
                            HStack {
                                Spacer()
                                Text("Maximum temperature \(Int(weather.main.tempMax))°")
                                    .foregroundColor(Color(.white))
                                    .font(.system(size: 15, weight: .light))
                                    .accessibilityIdentifier("maximumTemperatureLabel")
                                Spacer()
                            }
                            HStack {
                                Spacer()
                                Text("Minimal temperature \(Int(weather.main.tempMin))°")
                                    .foregroundColor(Color(.white))
                                    .font(.system(size: 15, weight: .light))
                                    .accessibilityIdentifier("minimalTemperatureLabel")
                                Spacer()
                            }
                        }.padding()
                    }
                    Spacer()
                    Divider().frame(height: 1).background(Color.white).padding(.horizontal, 100)
                    HStack {
                        HStack {
                            Spacer()
                            
                            Image(systemName: "sunrise.fill")
                                .foregroundColor(.white)
                            Text("\(getDateStringFromUnixTime(date: weather.sys.sunrise))")
                                .foregroundColor(Color(.white))
                                .font(.system(size: 15, weight: .light))
                                .accessibilityIdentifier("sunriseTimeLabel")
                        }
                        HStack {
                            Image(systemName: "sunset.fill")
                                .foregroundColor(.white)
                            Text("\(getDateStringFromUnixTime(date: weather.sys.sunset))")
                                .foregroundColor(Color(.white))
                                .font(.system(size: 15, weight: .light))
                                .accessibilityIdentifier("sunsetTimeLabel")
                            Spacer()
                        }
                    }
                    .padding(.top, 15)
                    .padding(.bottom, 25)
                }
            }
        }
    }
}

func GenerateColorPairForGradient(weather: String) -> [Color] {
    
    let skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)
    
    if weather == "Clouds" {
        return [.gray, skyBlue]
    }
    else if weather == "Clear" {
        return [.white, .blue]
    }
    else if weather == "Rain" {
        return [.black, .gray]
    }
    else if weather == "Snow" {
        return [.gray, .white]
    }
    else if weather == "Drizzle" {
        return [.black, .gray]
    }
    else {
        return [.purple, .red]
    }
}

