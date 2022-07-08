//
//  ActivityIndicatorTests.swift
//  SampleAppForXCUITestUITests
//
//  Created by Ihor Livinskyi on 08.07.2022.
//

import XCTest

class ActivityIndicatorTests: BaseTest {
     
    func testThatIndicatorDissappeared() throws {
        NavigationScreen().switchTo(tab: .loader)
        LoaderScreen().tapLoaderButton()
            .waitForActivityIndicator()
        XCTAssertTrue(LoaderScreen().greenTextExists())
    }
}
