//
//  ActivityIndicator.swift
//  SampleAppForXCUITest
//
//  Created by Ihor Livinskyi on 08.07.2022.
//

import SwiftUI

struct ActivityIndicator: View {
    
    @State var loaderActive: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            if loaderActive {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .accessibilityIdentifier("activityIndicator")
            }
            Spacer()
            Button(action: {
                startAtivityIndicator()
            }) {
                GreenButton(buttonText: "Press to start loading")
            }
            Spacer()
        }
    }
    
    func startAtivityIndicator() {
        loaderActive.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int.random(in: 1 ... 15)), execute: {
            loaderActive.toggle()
        })
        
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator()
    }
}
