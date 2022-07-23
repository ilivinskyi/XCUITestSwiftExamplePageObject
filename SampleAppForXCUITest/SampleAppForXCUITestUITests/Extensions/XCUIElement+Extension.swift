//
//  XCUIElement+Extension.swift
//  SampleAppForXCUITestUITests
//
//  Created by IL on 05.07.2022.
//

import XCTest

extension XCUIElement {
    /**
     Waits for XCUIElement to dissappear
     - Parameter timeout: waiting time
     */
    func waitForDissappear(timeout: Int) -> Bool {
        if self.waitForExistence(timeout: 5) {
            for _ in 1...timeout {
                if !exists {
                    return true
                }
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
        guard self.waitForExistence(timeout: 5) else {
            XCTFail("\(self.description) is not visible or can't be tapped")
            return
        }
        self.tap()
    }
    
    /**
     Checks if the element exists and can be tapped
     */
    func existsAndHitable() -> Bool {
        return self.waitForExistence(timeout: 10) && self.isHittable
    }
    
    /**
     Make force tap of the element
     */
    func forceTapElement() {
        if self.isHittable {
            self.tap()
        } else {
            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx: 0.0, dy: 0.0))
            coordinate.tap()
        }
    }
}
