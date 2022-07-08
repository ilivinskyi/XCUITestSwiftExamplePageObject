//
//  XCUIElement+Extension.swift
//  SampleAppForXCUITestUITests
//
//  Created by Ihor Livinskyi on 05.07.2022.
//

import Foundation
import XCTest

extension XCUIElement {
    func waitForDissappear(timeout: Int) {
        print("kek")
    }
    
    /**
     Removes any current text in the field before typing in the new value
     - Parameter text: the text to enter into the field
     */
    func clearAndEnterText(text: String) {
        _ = self.waitForExistence(timeout: 5)
        guard let stringValue = self.value as? String else {
            XCTFail("Tried to clear and enter text into a non string value")
            return
        }
        
        self.tap()
        
        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)
        
        self.typeText(deleteString)
        self.typeText(text)
    }
    
    /**
     Waits 5 seconds for element to appear and then taps it
     */
    func waitAndTap() {
        if self.waitForExistence(timeout: 5) {
            self.tap()
        } else {
            XCTFail("Element not exist")
        }
    }
}
