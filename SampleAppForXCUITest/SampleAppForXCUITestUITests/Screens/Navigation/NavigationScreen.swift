//
//  BaseScreen.swift
//  SampleAppForXCUITestUITests
//
//  Created by Ihor Livinskyi on 05.07.2022.
//

import XCTest

class NavigationScreen: BaseScreen {
    private lazy var calculateButton = app.buttons["calculateButton"]
    
    enum NavigationMenu: String {
        case bmi = "BMI Calc"
        case login = "Login"
        case loader = "Loader"
    }
    
    override init() {
        super.init()
        visible()
    }
    
    func switchTo(tab: NavigationMenu) {
        switch tab {
        case .bmi, .login, .loader:
            app.buttons[tab.rawValue].waitAndTap()
        }
    }
}

extension NavigationScreen {
    func visible() {
        guard calculateButton.waitForExistence(timeout: 5) else {
            XCTFail("Navigation Screen was not opened")
            return
        }
    }
}
