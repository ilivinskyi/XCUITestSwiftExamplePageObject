//
//  LoginScreen.swift
//  SampleAppForXCUITestUITests
//
//  Created by Ihor Livinskyi on 08.07.2022.
//

import XCTest

class LoginScreen: BaseScreen, TabBarProtocol {    
    lazy private var usernameField = app.textFields["usernameField"]
    lazy private var passwordField = app.secureTextFields["passwordField"]
    lazy private var loginButton = app.buttons["loginButton"]
    lazy private var messageText = app.staticTexts["messageText"]
    
    override init() {
        super.init()
        visible()
    }
    
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
    
    private func messageExists() -> Bool {
        messageText.waitForExistence(timeout: 10)
    }
    
    func getMessage() -> String {
        var message = ""
        if messageExists() {
            message = messageText.label
        }
        return message
    }
}

extension LoginScreen {
    func visible() {
        guard loginButton.waitForExistence(timeout: 5) else {
            XCTFail("Login Screen was not opened")
            return
        }
    }
}
