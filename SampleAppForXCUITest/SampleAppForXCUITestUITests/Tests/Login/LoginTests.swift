//
//  LoginTests.swift
//  SampleAppForXCUITestUITests
//
//  Created by Ihor Livinskyi on 08.07.2022.
//

import XCTest

class LoginTests: BaseTest {
    let testData = LoginScreenTestData()
    
    override func setUp() {
        super.setUp()
        NavigationScreen().tapLogin()
    }
    
    func testValidCredentials() throws {
        activity("Test that the user can log in with valid credentials") {
            let message = LoginScreen()
                .enterUsername(username: testData.validUsername)
                .enterPassword(password: testData.validPassowrd)
                .tapLoginButton()
                .getMessage()
            XCTAssertEqual(message, testData.successMessage)
        }
    }
    
    func testEmptyPassword() throws {
        activity("Test that an error message is shown if the user forgot to type the password") {
            let message = LoginScreen()
                .enterUsername(username: testData.validUsername)
                .enterPassword(password: "")
                .tapLoginButton()
                .getMessage()
            XCTAssertEqual(message, testData.emptyCredentialsErrorMessage)
        }
    }
    
    func testEmptyUsername() throws {
        activity("Test that an error message is shown if the user didn't input the username") {
            let message = LoginScreen()
                .enterUsername(username: testData.validUsername)
                .enterPassword(password: "")
                .tapLoginButton()
                .getMessage()
            XCTAssertEqual(message, testData.emptyCredentialsErrorMessage)
        }
    }
    
    func testInvalidCredentials() throws {
        activity("Test that error is shown if the user tries to use invalid credentials") {
            let message = LoginScreen()
                .enterUsername(username: testData.validUsername)
                .enterPassword(password: "123")
                .tapLoginButton()
                .getMessage()
            XCTAssertEqual(message, testData.incorrectCredentialsErrorMessage)
        }
    }
}
