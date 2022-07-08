//
//  LoginTests.swift
//  SampleAppForXCUITestUITests
//
//  Created by Ihor Livinskyi on 08.07.2022.
//

import XCTest

class LoginTests: BaseTest {
    
    let testData = LoginScreenTestData()
    
    func testValidCredentials() throws {
        NavigationScreen().switchTo(tab: .login)
        LoginScreen().enterUsername(username: testData.validUsername)
            .enterPassword(password: testData.validPassowrd)
            .tapLoginButton()
        XCTAssertEqual(LoginScreen().getSuccessMessage(), testData.successMessage, "")
    }
    
    func testEmptyPassword() throws {
        NavigationScreen().switchTo(tab: .login)
        LoginScreen().enterUsername(username: testData.validUsername)
            .enterPassword(password: "")
            .tapLoginButton()
        XCTAssertEqual(LoginScreen().getErrorMessage(), testData.emptyCredentialsErrorMessage)
    }
    
    func testEmptyUsername() throws {
        NavigationScreen().switchTo(tab: .login)
        LoginScreen().enterUsername(username: testData.validUsername)
            .enterPassword(password: "")
            .tapLoginButton()
        XCTAssertEqual(LoginScreen().getErrorMessage(), testData.emptyCredentialsErrorMessage)
    }
    
    func testInvalidCredentials() throws {
        NavigationScreen().switchTo(tab: .login)
        LoginScreen().enterUsername(username: testData.validUsername)
            .enterPassword(password: "123")
            .tapLoginButton()
        XCTAssertEqual(LoginScreen().getErrorMessage(), testData.incorrectCredentialsErrorMessage)
    }
}
