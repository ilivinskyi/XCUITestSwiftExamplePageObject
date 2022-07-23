//
//  SecretScreenTestData.swift
//  SampleAppForXCUITestUITests
//
//  Created by IL on 22.07.2022.
//

import Foundation

struct SecretScreenTestData {
    let invalidURL = "xctsecret://com.ilivinskyi.sampleapp.SampleAppForXCUITest/invalid"
    
    func buildValidURL(value: String) -> String {
        "xctsecret://com.ilivinskyi.sampleapp.SampleAppForXCUITest/secret?value=\(value)"
    }
}
