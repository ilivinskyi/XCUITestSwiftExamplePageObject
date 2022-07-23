//
//  DatePickerScreen.swift
//  SampleAppForXCUITestUITests
//
//  Created by IL on 23.07.2022.
//

import XCTest

enum AmPm: String {
    case amTime = "AM"
    case pmTime = "PM"
}

class DatePickerScreen: BaseScreen {
    private lazy var selectedDate = app.staticTexts["selectedDate"]
    private lazy var monthDayPicker = app.pickerWheels.element(boundBy: 0)
    private lazy var hourPicker = app.pickerWheels.element(boundBy: 1)
    private lazy var minutePicker = app.pickerWheels.element(boundBy: 2)
    private lazy var amPmPicker = app.pickerWheels.element(boundBy: 3)
    
    override init() {
        super.init()
        visible()
    }
    
    @discardableResult
    func selectDate(month: String, day: String, hour: Int, minute: Int, amPm: AmPm) -> Self {
        guard hour > 0 && hour < 13 && minute >= 0 && minute < 60 else {
            XCTFail("Incorrect date provided")
            return self
        }
        
        let monthDay = "\(month) \(day)"
        let minuteString = minute < 10 ? String(format: "%02d", minute) : minute.description
        monthDayPicker.adjust(toPickerWheelValue: monthDay)
        hourPicker.adjust(toPickerWheelValue: hour.description)
        minutePicker.adjust(toPickerWheelValue: minuteString)
        amPmPicker.adjust(toPickerWheelValue: amPm.rawValue)
        
        return self
    }
    
    func getCurrentDate() -> String {
        selectedDate.label
    }
}

extension DatePickerScreen {
    func visible() {
    guard selectedDate.waitForExistence(timeout: 5) else {
            XCTFail("Date picker screen not opened")
            return
        }
    }
}
