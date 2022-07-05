//
//  TextFieldsDataModel.swift
//  SampleAppForXCUITest
//
//  Created by Ihor Livinskyi on 04.07.2022.
//

import Foundation

class TextFieldsDataModel {
    let height: Double
    let weight: Double
    let bmi: Double
    
    init(height: Double, weight: Double) {
        self.height = height
        self.weight = weight
        self.bmi = weight / (height * 2)
    }
}
