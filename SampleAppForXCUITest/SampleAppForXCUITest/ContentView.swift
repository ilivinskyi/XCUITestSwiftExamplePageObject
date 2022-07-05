//
//  ContentView.swift
//  SampleAppForXCUITest
//
//  Created by Ihor Livinskyi on 04.07.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            BMICalc()
                .tabItem {
                    Label("BMI Calc", systemImage: "heart.fill")
                }
                .accessibilityIdentifier("bmiCalcTab")
            ToDoList()
                .tabItem {
                    Label("ToDo list", systemImage: "checkmark.circle")
                }
                .accessibilityIdentifier("toDoList")
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
