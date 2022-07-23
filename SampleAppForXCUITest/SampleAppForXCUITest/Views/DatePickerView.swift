//
//  DatePickerView.swift
//  SampleAppForXCUITest
//
//  Created by IL on 23.07.2022.
//

import SwiftUI

struct DatePickerView: View {
    @State private var birthDate = Date()
    
    var body: some View {
        VStack {
            DatePicker(selection: $birthDate, in: Date()..., displayedComponents: [.date, .hourAndMinute]) {
            }
            .datePickerStyle(WheelDatePickerStyle())
            .background(Color.blue)
            Spacer()
            Text("Date is \(birthDate.formatted(date: .long, time: .shortened))")
                .accessibilityIdentifier("selectedDate")
            Spacer()
        }
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
