//
//  LoginTests.swift
//  SampleAppForXCUITestUITests
//
//  Created by Ihor Livinskyi on 08.07.2022.
//

import Foundation
import XCTest

class LoginTests: BaseTest {
    
    let validUsername = "admin"
    let validPassowrd = "password"
    let emptyCredentialsErrorMessage = "Please email and password"
    let incorrectCredentialsErrorMessage = "Worng password or email"
    let successMessage = "Correct!"
    
    func testValidCredentials() throws {
        NavigationScreen().switchTo(tab: .login)
        LoginScreen().enterUsername(username: validUsername)
            .enterPassword(password: validPassowrd)
            .tapLoginButton()
        XCTAssertEqual(LoginScreen().getSuccessMessage(), successMessage, "")
    }
    
    func testEmptyPassword() throws {
        NavigationScreen().switchTo(tab: .login)
        LoginScreen().enterUsername(username: validUsername)
            .enterPassword(password: "")
            .tapLoginButton()
        XCTAssertEqual(LoginScreen().getErrorMessage(), emptyCredentialsErrorMessage)
    }
    
    func testEmptyUsername() throws {
        NavigationScreen().switchTo(tab: .login)
        LoginScreen().enterUsername(username: validUsername)
            .enterPassword(password: "")
            .tapLoginButton()
        XCTAssertEqual(LoginScreen().getErrorMessage(), emptyCredentialsErrorMessage)
    }
    
    func testInvalidCredentials() throws {
        NavigationScreen().switchTo(tab: .login)
        LoginScreen().enterUsername(username: validUsername)
            .enterPassword(password: "123")
            .tapLoginButton()
        XCTAssertEqual(LoginScreen().getErrorMessage(), incorrectCredentialsErrorMessage)
    }
}
