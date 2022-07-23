//
//  DatePickerScreenTestData.swift
//  SampleAppForXCUITestUITests
//
//  Created by IL on 23.07.2022.
//

import XCTest

struct DatePickerScreenTestData {
    let today = Date()
    
    func getTestDate(days: Int) -> Date.TestDate {
        guard let testDate = today.getTestDateForTodayPlus(days: days) else {
            XCTFail("Unable to create date")
            return ("", "", "")
        }
        return (testDate.day, testDate.month, testDate.year)
    }
    
    func getTestTime() -> (hours: Int, minutes: Int, amPm: AmPm) {
        let hours = Int.random(in: 0..<12)
        let minutes = Int.random(in: 0..<59)
        let amPm = [AmPm.amTime, AmPm.pmTime].randomElement()
        return (hours, minutes, amPm!)
    }
    
    func buildTimeString(hours: Int, minutes: Int, amPm: AmPm) -> String {
        return "\(hours):\(minutes < 10 ? String(format: "%02d", minutes) : minutes.description) \(amPm.rawValue)"
    }
}
