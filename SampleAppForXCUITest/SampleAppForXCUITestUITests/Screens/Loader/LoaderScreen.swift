//
//  LoaderScreen.swift
//  SampleAppForXCUITestUITests
//
//  Created by Ihor Livinskyi on 08.07.2022.
//

import XCTest

class LoaderScreen: Screen {
    var app: XCUIApplication
    
    init() {
        app = XCUIApplication()
    }
    
    private lazy var loaderButton = app.buttons["loaderButton"]
    private lazy var activityIndicator = app.otherElements["activityIndicator"]
    private lazy var greenText = app.staticTexts["greenText"]
    
    @discardableResult func tapLoaderButton() -> Self {
        loaderButton.waitAndTap()
        return self
    }
    
    func activityIndicatorExists() -> Bool {
        activityIndicator.exists
    }
    
    @discardableResult func waitForActivityIndicator() -> Self {
        _ = activityIndicator.waitForDissappear(timeout: 30)
        return self
    }
    
    func greenTextExists() -> Bool {
        greenText.waitForExistence(timeout: 5)
    }
}
