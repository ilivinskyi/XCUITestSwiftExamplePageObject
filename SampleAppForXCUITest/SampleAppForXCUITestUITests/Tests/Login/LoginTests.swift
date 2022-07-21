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
        activity("Test that the user can log in with valid credentials") {
            NavigationScreen().switchTo(tab: .login)
            LoginScreen().enterUsername(username: testData.validUsername)
                .enterPassword(password: testData.validPassowrd)
                .tapLoginButton()
            XCTAssertEqual(LoginScreen().getSuccessMessage(), testData.successMessage, "")
        }
    }
    
    func testEmptyPassword() throws {
        activity("Test that an error message is shown if the user forgot to type the password") {
            NavigationScreen().switchTo(tab: .login)
            LoginScreen().enterUsername(username: testData.validUsername)
                .enterPassword(password: "")
                .tapLoginButton()
            XCTAssertEqual(LoginScreen().getErrorMessage(), testData.emptyCredentialsErrorMessage)
        }
    }
    
    func testEmptyUsername() throws {
        activity("Test that an error message is shown if the user didn't input the username") {
            NavigationScreen().switchTo(tab: .login)
            LoginScreen().enterUsername(username: testData.validUsername)
                .enterPassword(password: "")
                .tapLoginButton()
            XCTAssertEqual(LoginScreen().getErrorMessage(), testData.emptyCredentialsErrorMessage)
        }
    }
    
    func testInvalidCredentials() throws {
        activity("Test that error is shown if the user tries to use invalid credentials") {
            NavigationScreen().switchTo(tab: .login)
            LoginScreen().enterUsername(username: testData.validUsername)
                .enterPassword(password: "123")
                .tapLoginButton()
            XCTAssertEqual(LoginScreen().getErrorMessage(), testData.incorrectCredentialsErrorMessage)
        }
    }
}
