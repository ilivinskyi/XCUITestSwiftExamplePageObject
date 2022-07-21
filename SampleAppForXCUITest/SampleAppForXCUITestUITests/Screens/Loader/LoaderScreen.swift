//
//  LoaderScreen.swift
//  SampleAppForXCUITestUITests
//
//  Created by Ihor Livinskyi on 08.07.2022.
//

import XCTest

class LoaderScreen: BaseScreen {    
    private lazy var loaderButton = app.buttons["loaderButton"]
    private lazy var activityIndicator = app.otherElements["activityIndicator"]
    private lazy var greenText = app.staticTexts["greenText"]
    
    override init() {
        super.init()
        visible()
    }
    
    @discardableResult func waitForActivityIndicator() -> Self {
        _ = activityIndicator.waitForDissappear(timeout: 30)
        return self
    }
    
    @discardableResult func tapLoaderButton() -> Self {
        loaderButton.waitAndTap()
        return self
    }
    
    func activityIndicatorExists() -> Bool {
        activityIndicator.exists
    }
        
    func greenTextExists() -> Bool {
        greenText.waitForExistence(timeout: 5)
    }
}

extension LoaderScreen {
    func visible() {
        guard loaderButton.waitForExistence(timeout: 5) else {
            XCTFail("Loader Screen was not opened")
            return
        }
    }
}
