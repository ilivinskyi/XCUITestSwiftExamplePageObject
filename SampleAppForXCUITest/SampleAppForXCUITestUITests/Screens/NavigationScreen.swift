//
//  BaseScreen.swift
//  SampleAppForXCUITestUITests
//
//  Created by Ihor Livinskyi on 05.07.2022.
//

import Foundation
import XCTest
import SwiftUI

protocol Screen {
    var app: XCUIApplication { get }
}

class NavigationScreen: Screen {
    var app: XCUIApplication
    
    init() {
        app = XCUIApplication()
    }
    
    enum NavigationMenu: String {
        case bmi = "BMI Calc"
        case login = "Login"
    }
    
    func switchTo(tab: NavigationMenu) {
        switch tab {
        case .bmi:
            app.buttons[tab.rawValue].waitAndTap()
        case .login:
            app.buttons[tab.rawValue].waitAndTap()
        }
    }
}
