//
//  BMIScreen.swift
//  SampleAppForXCUITestUITests
//
//  Created by Ihor Livinskyi on 05.07.2022.
//

import XCTest

class BMIScreen: BaseScreen {    
    private lazy var heightTextField = app.textFields["heightTextField"]
    private lazy var weightTextField = app.textFields["weightTextField"]
    private lazy var calculateButton = app.buttons["calculateButton"]
    private lazy var bmiResult = app.staticTexts["usersBMI"]
    
    override init() {
        super.init()
        visible()
    }
    
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

extension BMIScreen {
    func visible() {
        guard calculateButton.waitForExistence(timeout: 5) else {
            XCTFail("Loader Screen was not opened")
            return
        }
    }
}
