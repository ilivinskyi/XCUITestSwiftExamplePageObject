//
//  LoginScreen.swift
//  SampleAppForXCUITestUITests
//
//  Created by Ihor Livinskyi on 08.07.2022.
//

import XCTest

class LoginScreen: Screen {
    var app: XCUIApplication
    
    init() {
        app = XCUIApplication()
    }
    
    lazy private var usernameField = app.textFields["usernameField"]
    lazy private var passwordField = app.secureTextFields["passwordField"]
    lazy private var loginButton = app.buttons["loginButton"]
    lazy private var errorText = app.staticTexts["errorText"]
    lazy private var successText = app.staticTexts["successText"]
    
    @discardableResult func tapLoginButton() -> Self {
        loginButton.waitAndTap()
        return self
    }
    
    @discardableResult func enterUsername(username: String) -> Self {
        if usernameField.waitForExistence(timeout: 5) {
            usernameField.clearAndEnterText(text: username)
        }
        return self
    }
    
    @discardableResult func enterPassword(password: String) -> Self {
        if passwordField.waitForExistence(timeout: 5) {
            passwordField.clearAndEnterText(text: password)
        }
        return self
    }
    
    func getErrorMessage() -> String {
        var message = ""
        if errorMessageExists() {
            message = errorText.label
        }
        return message
    }
    
    func getSuccessMessage() -> String {
        var message = ""
        if successMessageExists() {
            message = successText.label
        }
        return message
    }
    
    private func errorMessageExists() -> Bool {
        errorText.waitForExistence(timeout: 10)
    }
    
    private func successMessageExists() -> Bool {
        successText.waitForExistence(timeout: 10)
    }
}
