//
//  GreenButton.swift
//  SampleAppForXCUITest
//
//  Created by IL on 08.07.2022.
//

import SwiftUI

struct GreenButton: View {
    
    var buttonText: String
    
    init(buttonText: String) {
        self.buttonText = buttonText
    }
    
    var body: some View {
        return Text(buttonText)
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.green)
            .cornerRadius(15.0)
    }
}

struct GreenButton_Previews: PreviewProvider {
    static var previews: some View {
        GreenButton(buttonText: "Login")
    }
}
