//
//  DatePickerTests.swift
//  SampleAppForXCUITestUITests
//
//  Created by IL on 23.07.2022.
//

import XCTest

class DatePickerTests: BaseTest {
    
    func testThatDateSelected() throws {
        activity("Check that selected date is shown in the label") {
            let testDate = DatePickerScreenTestData().getTestDate(days: 5)
            let testTime = DatePickerScreenTestData().getTestTime()
            let timeString = DatePickerScreenTestData().buildTimeString(hours: testTime.hours, minutes: testTime.minutes, amPm: testTime.amPm)
           
            let currentDateString = NavigationScreen()
                .tapDate()
                .selectDate(month: testDate.month, day: testDate.day, hour: testTime.hours, minute: testTime.minutes, amPm: testTime.amPm)
                .getCurrentDate()
            XCTAssertTrue(currentDateString.contains(testDate.month))
            XCTAssertTrue(currentDateString.contains(testDate.day))
            XCTAssertTrue(currentDateString.contains(testDate.year))
            XCTAssertTrue(currentDateString.contains(timeString), "Expected to have \(timeString) time, but got \(currentDateString)")
        }
    }
}
