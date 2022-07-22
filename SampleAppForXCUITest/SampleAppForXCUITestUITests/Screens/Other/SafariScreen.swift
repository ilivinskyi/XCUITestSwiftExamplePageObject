//
//  SafariBridge.swift
//  SampleAppForXCUITestUITests
//
//  Created by Ihor Livinskyi on 22.07.2022.
//

import XCTest

class SafariScreen {
    let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
    
    @discardableResult
    func open() -> Self {
        safari.launch()
        XCTAssert(safari.wait(for: .runningForeground, timeout: 5))
        return self
    }
    
    @discardableResult
    func goToURL(_ url: String) -> Self {
        safari.textFields.firstMatch.waitAndTap()
        safari.textFields.firstMatch.clearAndEnterText(text: url)
        if safari.buttons["Continue"].exists {
            safari.buttons["Continue"].tap()
        }
        safari.buttons["Go"].tap()
        return self
    }
    
    @discardableResult
    func openDeepLink() -> SecretScreen {
        safari.buttons["Open"].waitAndTap()
        return SecretScreen()
    }
}
