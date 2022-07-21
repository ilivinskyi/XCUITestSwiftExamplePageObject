//
//  ActivityIndicatorTests.swift
//  SampleAppForXCUITestUITests
//
//  Created by Ihor Livinskyi on 08.07.2022.
//

import XCTest

class ActivityIndicatorTests: BaseTest {
    
    func testThatIndicatorDissappeared() throws {
        activity("Check that green text is visible after the activity indicator disappears") {
            NavigationScreen().tapLoader()
            LoaderScreen()
                .tapLoaderButton()
                .waitForActivityIndicator()
            XCTAssertTrue(LoaderScreen().greenTextExists())
        }
    }
}
