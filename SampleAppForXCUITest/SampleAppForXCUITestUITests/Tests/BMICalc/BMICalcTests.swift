//
//  SampleAppForXCUITestUITestsLaunchTests.swift
//  SampleAppForXCUITestUITests
//
//  Created by Ihor Livinskyi on 04.07.2022.
//

import XCTest

class BMICalcTests: BaseTest {
    
    let testData = BMIScreenTestData()
    
    func testCorrectBMIResult() {
        activity("Test that BMI was calculated correctly") {
            BMIScreen().enterHeight(value: testData.testHeight)
                .enterWeight(value: testData.testWeight)
                .clickCalculateButton()
            let bmi = BMIScreen().getBMIValue()
            XCTAssertEqual(bmi, testData.expectedBMI, "Error. Exptected BMI to be \(testData.expectedBMI), but got \(bmi) instead")
        }
    }
    
    func testOnlyHeight() {
        activity("Check that BMI is not calculated if weight was not entered") {
            BMIScreen().enterHeight(value: testData.testHeight)
                .clickCalculateButton()
            let bmi = BMIScreen().getBMIValue()
            XCTAssertEqual(bmi, "0.0", "BMI should be equal to 0.0 but got \(bmi) instead")
        }
    }
    
    func testOnlyWeight() {
        activity("Check that BMI is not calculated if height was not entered") {
            BMIScreen().enterWeight(value: testData.testWeight)
                .clickCalculateButton()
            let bmi = BMIScreen().getBMIValue()
            XCTAssertEqual(bmi, "inf", "BMI should be equal to 0.0 but got \(bmi) instead")
        }
    }
}
