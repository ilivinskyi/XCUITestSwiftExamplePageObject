//
//  SecretView.swift
//  SampleAppForXCUITest
//
//  Created by IL on 22.07.2022.
//

import SwiftUI

struct SecretView: View {
    
    var value: String
    
    var body: some View {
        VStack {
            Text("Deeplink opened")
                .font(.title)
                .accessibilityIdentifier("deeplinkSuccessMessage")
            Text("My deeplink value is: \(self.value)")
                .font(.title2)
                .accessibilityIdentifier("deeplinkValue")
        }.background(Color.green)
    }
}

struct SecretView_Previews: PreviewProvider {
    static var previews: some View {
        SecretView(value: "15")
    }
}
