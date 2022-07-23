//
//  ActivityIndicatorTests.swift
//  SampleAppForXCUITestUITests
//
//  Created by IL on 08.07.2022.
//

import XCTest

class ActivityIndicatorTests: BaseTest {
    
    func testThatIndicatorDissappeared() throws {
        activity("Check that green text is visible after the activity indicator disappears") {
            let loaderScreen = NavigationScreen()
                .tapLoader()
                .tapLoaderButton()
                .waitForActivityIndicator()
            XCTAssertTrue(loaderScreen.greenTextExists())
        }
    }
}
