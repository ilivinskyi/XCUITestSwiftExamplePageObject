//
//  DeepLink.swift
//  SampleAppForXCUITestUITests
//
//  Created by IL on 22.07.2022.
//

import XCTest

class SecretScreen: BaseScreen {
    private lazy var successMessage = app.staticTexts["deeplinkSuccessMessage"]
    private lazy var deepLinkValue = app.staticTexts["deeplinkValue"]
    
    func successMessageExists() -> Bool {
        successMessage.waitForExistence(timeout: 5)
    }
    
    func getDeepLinkValue() -> String {
        deepLinkValue.label
    }
}
