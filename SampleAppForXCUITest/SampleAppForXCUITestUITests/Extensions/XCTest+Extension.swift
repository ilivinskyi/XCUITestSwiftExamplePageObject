//
//  XCTest+Extension.swift
//  SampleAppForXCUITestUITests
//
//  Created by Ihor Livinskyi on 21.07.2022.
//

import XCTest

extension XCTestCase {
    func activity<T>(_ description: String, block: () throws -> T) rethrows -> T {
        try XCTContext.runActivity(named: description, block: { _ in try block() })
    }
}
