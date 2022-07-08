//
//  SampleAppForXCUITestUITestsLaunchTests.swift
//  SampleAppForXCUITestUITests
//
//  Created by Ihor Livinskyi on 04.07.2022.
//

import XCTest

class BMICalcTests: BaseTest {
    
    let testHeight = 185
    let testWeight = 85
    let expectedBMI = "23.0"
    
    func testCorrectBMIResult() {
        BMIScreen().enterHeight(value: testHeight)
            .enterWeight(value: testWeight)
            .clickCalculateButton()
        let bmi = BMIScreen().getBMIValue()
        XCTAssertEqual(bmi, expectedBMI, "Error. Exptected BMI to be \(expectedBMI), but got \(bmi) instead")
    }
    
    func testOnlyHeight() {
        BMIScreen().enterHeight(value: testHeight)
            .clickCalculateButton()
        let bmi = BMIScreen().getBMIValue()
        XCTAssertEqual(bmi, "0.0", "BMI should be equal to 0.0 but got \(bmi) instead")
    }
    
    func testOnlyWeight() {
        BMIScreen().enterWeight(value: testWeight)
            .clickCalculateButton()
        let bmi = BMIScreen().getBMIValue()
        XCTAssertEqual(bmi, "inf", "BMI should be equal to 0.0 but got \(bmi) instead")
    }
}
