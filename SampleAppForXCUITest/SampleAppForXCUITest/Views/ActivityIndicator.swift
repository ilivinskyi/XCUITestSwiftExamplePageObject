//
//  ActivityIndicator.swift
//  SampleAppForXCUITest
//
//  Created by IL on 08.07.2022.
//

import SwiftUI

struct ActivityIndicator: View {
    
    @State var loaderActive: Bool = false
    @State var showText: Bool = false
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.blue, .lightGray]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                if loaderActive {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .accessibilityIdentifier("activityIndicator")
                }
                if showText {
                    Text("Correct!")
                        .font(.title2)
                        .foregroundColor(.green)
                        .accessibilityIdentifier("greenText")
                }
                Spacer()
                Button(action: {
                    startAtivityIndicator()
                }) {
                    GreenButton(buttonText: "Press to start loading")
                }
                .accessibilityIdentifier("loaderButton")
                Spacer()
            }
        }
    }
    
    func startAtivityIndicator() {
        if showText {
            showText.toggle()
        }
        loaderActive.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int.random(in: 1...15)), execute: {
            loaderActive.toggle()
            showText.toggle()
        })
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator()
    }
}
