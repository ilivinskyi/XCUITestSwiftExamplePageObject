//
//  XCUIElement+Extension.swift
//  SampleAppForXCUITestUITests
//
//  Created by Ihor Livinskyi on 05.07.2022.
//

import XCTest

extension XCUIElement {
    
    /**
     Waits for XCUIElement to dissappear
     - Parameter timeout: waiting time
     */
    func waitForDissappear(timeout: Double) -> Bool {
        if self.waitForExistence(timeout: 5) {
            var counter = 0
            let timeStart = Date().timeIntervalSince1970
            while (Date().timeIntervalSince1970 <= (timeStart + timeout)) {
                if !exists {
                    print("Total waiting time was: \(counter)")
                    return true
                }
                counter += 1
                sleep(1)
            }
        }
        return false
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
