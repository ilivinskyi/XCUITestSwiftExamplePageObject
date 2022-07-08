//
//  BMIScreen.swift
//  SampleAppForXCUITestUITests
//
//  Created by Ihor Livinskyi on 05.07.2022.
//

import XCTest

class BMIScreen: Screen {
    
    var app: XCUIApplication
    
    init() {
        app = XCUIApplication()
    }
    
    lazy var heightTextField = app.textFields["heightTextField"]
    lazy var weightTextField = app.textFields["weightTextField"]
    lazy var calculateButton = app.buttons["calculateButton"]
    lazy var bmiResult = app.staticTexts["usersBMI"]
    
    @discardableResult func clickCalculateButton() -> Self {
        calculateButton.waitAndTap()
        return self
    }
    
    @discardableResult func enterHeight(value: Int) -> Self {
        heightTextField.clearAndEnterText(text: String(value))
        return self
    }
    
    @discardableResult func enterWeight(value: Int) -> Self {
        weightTextField.clearAndEnterText(text: String(value))
        return self
    }
    
    func getBMIValue() -> String {
        if bmiResult.waitForExistence(timeout: 5) {
            return bmiResult.label
        } else {
            XCTFail("BMI result not available")
            return ""
        }
    }
    
    
}
