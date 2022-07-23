//
//  SampleAppForXCUITestUITestsLaunchTests.swift
//  SampleAppForXCUITestUITests
//
//  Created by IL on 04.07.2022.
//

import XCTest

class BMICalcTests: BaseTest {
    let testData = BMIScreenTestData()
    
    func testCorrectBMIResult() {
        activity("Test that BMI was calculated correctly") {
            let bmi = BMIScreen()
                .enterHeight(value: testData.testHeight)
                .enterWeight(value: testData.testWeight)
                .clickCalculateButton()
                .getBMIValue()
            XCTAssertEqual(bmi, testData.expectedBMI, "Error. Exptected BMI to be \(testData.expectedBMI), but got \(bmi) instead")
        }
    }
    
    func testOnlyHeight() {
        activity("Check that BMI is not calculated if weight was not entered") {
            let bmi = BMIScreen()
                .enterHeight(value: testData.testHeight)
                .clickCalculateButton()
                .getBMIValue()
            XCTAssertEqual(bmi, "0.0", "BMI should be equal to 0.0 but got \(bmi) instead")
        }
    }
    
    func testOnlyWeight() {
        activity("Check that BMI is not calculated if height was not entered") {
            let bmi = BMIScreen()
                .enterWeight(value: testData.testWeight)
                .clickCalculateButton()
                .getBMIValue()
            XCTAssertEqual(bmi, "inf", "BMI should be equal to inf but got \(bmi) instead")
        }
    }
}
