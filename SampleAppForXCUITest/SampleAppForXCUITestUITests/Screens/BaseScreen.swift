//
//  BaseScreen.swift
//  SampleAppForXCUITestUITests
//
//  Created by IL on 21.07.2022.
//

import XCTest

class BaseScreen {
    let app = XCUIApplication()
    
    func appInForeground() -> Bool {
        app.wait(for: .runningForeground, timeout: 5)
    }
}
