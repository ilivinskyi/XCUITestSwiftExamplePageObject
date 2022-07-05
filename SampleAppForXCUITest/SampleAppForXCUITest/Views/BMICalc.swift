//
//  BMICalc.swift
//  SampleAppForXCUITest
//
//  Created by Ihor Livinskyi on 04.07.2022.
//

import SwiftUI

struct BMICalc: View {
    
    @State private var height: Double = 0.0
    @State private var weight: Double = 0.0
    @State private var bmiValue: Double = 0.0
    @State private var resultHidden: Bool = true
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Input your height in cm")
                TextField("Height", value: $height, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .accessibilityIdentifier("heightTextField")
                Spacer()
            }
            HStack {
                Spacer()
                Text("Input your weight in kg")
                TextField("Weight", value: $weight, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .accessibilityIdentifier("weightTextField")
                Spacer()
            }
            Spacer()
            VStack {
                if !resultHidden {
                    VStack {
                        Text("Your height is: \(String(format: "%.1f", height))cm")
                            .accessibilityIdentifier("usersHeightLabel")
                        Text("Your weight is: \(String(format: "%.1f", weight))kg")
                            .accessibilityIdentifier("usersWeightLabel")
                        Text(String(format: "%.1f", bmiValue * 100))
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.red)
                            .padding()
                            .frame(height: 0.0)
                            .accessibilityIdentifier("usersBMI")
                    }
                }
                
                Button(action: {
                    bmiValue = calculateBMI()
                    resultHidden = false
                }) {
                    Text("Calculate BMI")
                }
                .padding()
                .accessibilityIdentifier("calculateButton")
            }
            Spacer()
        }.padding()
    }
    
    func calculateBMI() -> Double {
        weight / (height * 2)
    }
}

struct BMICalc_Previews: PreviewProvider {
    static var previews: some View {
        BMICalc()
    }
}
