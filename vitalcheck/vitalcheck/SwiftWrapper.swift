//
//  SwiftWrapper.swift
//  vitalcheck
//
//  Created by junga yang on 2024/05/05.
//

// SwiftWrapper.swift

import Foundation

class SwiftWrapper {
    private let cppWrapper = CppWrapper()
    
    func diagnoseBloodPressure(systolic: Int, diastolic: Int) -> String {
        return cppWrapper.diagnoseBloodPressure(withSystolic: Int32(systolic), diastolic: Int32(diastolic))
    }
    
    func generateHealthAdvice(systolic: Int, diastolic: Int, age: Int, gender: String, weight: Double) -> String {
        return cppWrapper.generateHealthAdvice(withSystolic: Int32(systolic), diastolic: Int32(diastolic), age: Int32(age), gender: gender, weight: weight)
    }
    
    func possibleComplications(systolic: Int, diastolic: Int) -> String {
        return cppWrapper.possibleComplications(withSystolic: Int32(systolic), diastolic: Int32(diastolic))
    }
}
