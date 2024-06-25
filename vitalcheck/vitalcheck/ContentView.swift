
//
//  ContentView.swift
//  vitalcheck
//
//  Created by junga yang on 2024/05/05.
//

import SwiftUI

struct ContentView: View {
    // 혈압 입력을 위한 상태 변수 선언
    @State private var systolicPressure = ""
    @State private var diastolicPressure = ""
    @State private var age = ""
    @State private var gender = "남성" // 기본값을 "남성"으로 설정
    @State private var weight = ""
    
    let swiftWrapper = SwiftWrapper()
    
    // 혈압 진단 및 건강 조언 결과를 저장할 변수
    @State private var diagnosisResult = ""
    @State private var healthAdvice = ""
    @State private var complications = ""
    
    var body: some View {
        VStack {
            Text("혈압을 입력하시오")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
            // 수축기 혈압 입력 필드
            TextField("수축기 혈압 (Systolic Pressure)", text: $systolicPressure)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            
            // 이완기 혈압 입력 필드
            TextField("이완기 혈압 (Diastolic Pressure)", text: $diastolicPressure)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            
            // 나이 입력 필드
            TextField("나이 (Age)", text: $age)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            
            // 성별 선택 필드
            Picker("성별 (Gender)", selection: $gender) {
                Text("남성").tag("남성")
                Text("여성").tag("여성")
                Text("기타").tag("기타")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            // 체중 입력 필드
            TextField("체중 (Weight)", text: $weight)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
            
            // 혈압 진단 버튼
            Button(action: diagnoseBloodPressure) {
                Text("혈압 진단")
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            
            // 진단 결과 및 건강 조언 표시
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    if !diagnosisResult.isEmpty {
                        Text("진단 결과:")
                            .font(.headline)
                        Text(diagnosisResult)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .foregroundColor(diagnosisResult.contains("고혈압") ? .red : .black)
                    }
                    
                    if !healthAdvice.isEmpty {
                        Text("건강 조언:")
                            .font(.headline)
                        Text(healthAdvice)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                    
                    if !complications.isEmpty {
                        Text("합병증:")
                            .font(.headline)
                        Text(complications)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                }
            }
        }
        .padding()
    }
    
    // 혈압 진단 함수
    func diagnoseBloodPressure() {
        guard let systolic = Int(systolicPressure),
              let diastolic = Int(diastolicPressure),
              let age = Int(age),
              let weight = Double(weight) else {
            diagnosisResult = "다시 입력해 주십시오"
            healthAdvice = ""
            complications = ""
            return
        }
        
        diagnosisResult = swiftWrapper.diagnoseBloodPressure(systolic: systolic, diastolic: diastolic)
        healthAdvice = swiftWrapper.generateHealthAdvice(systolic: systolic, diastolic: diastolic, age: age, gender: gender, weight: weight)
        complications = swiftWrapper.possibleComplications(systolic: systolic, diastolic: diastolic)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
