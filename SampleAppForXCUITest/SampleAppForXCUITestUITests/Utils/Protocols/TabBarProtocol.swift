//
//  TabBarProtocol.swift
//  SampleAppForXCUITestUITests
//
//  Created by IL on 21.07.2022.
//

import XCTest

protocol TabBarProtocol {
    func tapBMI() -> BMIScreen
    func tapLogin() -> LoginScreen
    func tapLoader() -> LoaderScreen
    func tapDate() -> DatePickerScreen
}

extension TabBarProtocol {
    @discardableResult func tapBMI() -> BMIScreen {
        XCUIApplication().buttons["BMI Calc"].waitAndTap()
        return BMIScreen()
    }
    
    @discardableResult func tapLogin() -> LoginScreen {
        XCUIApplication().buttons["Login"].waitAndTap()
        return LoginScreen()
    }
    
    @discardableResult func tapLoader() -> LoaderScreen {
        XCUIApplication().buttons["Loader"].waitAndTap()
        return LoaderScreen()
    }
    
    @discardableResult func tapDate() -> DatePickerScreen {
        XCUIApplication().buttons["Date"].waitAndTap()
        return DatePickerScreen()
    }
}
