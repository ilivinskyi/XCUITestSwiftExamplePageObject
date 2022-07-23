//
//  ContentView.swift
//  SampleAppForXCUITest
//
//  Created by IL on 04.07.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            BMICalc()
                .tabItem {
                    Label("BMI Calc", systemImage: "heart.fill")
                }
            LoginPage()
                .tabItem {
                    Label("Login", systemImage: "person.fill")
                }
            ActivityIndicator()
                .tabItem {
                    Label("Loader", systemImage: "star.leadinghalf.filled")
                }
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
