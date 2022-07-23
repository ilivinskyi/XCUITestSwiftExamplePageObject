//
//  DeepLinkTests.swift
//  SampleAppForXCUITestUITests
//
//  Created by IL on 22.07.2022.
//

import XCTest

class DeepLinkTests: BaseTest {
    let testValue = "12345"
    
    func testSecretScreenOpens() throws {
        activity("Check that secret page can be opened from deeplink") {
            let url = SecretScreenTestData().buildValidURL(value: self.testValue)
            let safari = SafariScreen()
            let secretScreen = safari
                .open()
                .goToURL(url)
                .openDeepLink()
            XCTAssertTrue(secretScreen.appInForeground())
            XCTAssertTrue(secretScreen.successMessageExists())
            XCTAssertTrue(secretScreen.getDeepLinkValue().contains(self.testValue))
        }
    }
    
    func testSecretScreenNotOpensWithIncorrectURL() throws {
        activity("Check that secret page can be opened from deeplink") {
            let url = SecretScreenTestData().invalidURL
            let safari = SafariScreen()
            let secretScreen = safari
                .open()
                .goToURL(url)
                .openDeepLink()
            XCTAssertTrue(secretScreen.appInForeground())
            XCTAssertFalse(secretScreen.successMessageExists())
        }
    }
}
