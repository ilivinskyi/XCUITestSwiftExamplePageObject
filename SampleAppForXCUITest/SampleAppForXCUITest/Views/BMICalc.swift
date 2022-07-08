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
                Text("Height (cm)")
                    .font(.title2)
                TextField("Height", value: $height, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.lightGray)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                    .accessibilityIdentifier("heightTextField")
            }
            .padding()
            HStack {
                Text("Weight (kg)")
                    .font(.title2)
                TextField("Weight", value: $weight, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.lightGray)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                    .accessibilityIdentifier("weightTextField")
            }.padding()
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
                    GreenButton(buttonText: "Calculate BMI")
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
