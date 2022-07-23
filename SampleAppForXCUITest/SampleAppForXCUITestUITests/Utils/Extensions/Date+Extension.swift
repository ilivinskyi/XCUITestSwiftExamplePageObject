//
//  Date+Extension.swift
//  SampleAppForXCUITestUITests
//
//  Created by IL on 23.07.2022.
//

import Foundation

extension Date {
    typealias TestDate = (day: String, month: String, year: String)
    
    func getTestDateForTodayPlus(days: Int) -> TestDate? {
        var components = DateComponents()
        components.setValue(days, for: .day)
        
        guard let futureDate = Calendar.current.date(byAdding: components, to: self) else { return nil }
        
        let futureDay = Calendar.current.component(.day, from: futureDate).description
        let futureMonthInt = Calendar.current.component(.month, from: futureDate)
        let futureMonth = DateFormatter().shortMonthSymbols[futureMonthInt - 1]
        let futureYear = Calendar.current.component(.year, from: futureDate).description
        
        return (futureDay, futureMonth, futureYear)
    }
}
