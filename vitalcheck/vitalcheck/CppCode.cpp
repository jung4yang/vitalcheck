//
//  CppCode.cpp
//  vitalcheck
//
//  Created by junga yang on 2024/05/05.
//

#include "CppCode.hpp"
#include <string>

// 혈압 진단 함수 구현
std::string CppCode::diagnoseBloodPressure(int systolic, int diastolic) {
    std::string result;

    if (systolic < 90 || diastolic < 60) {
        result = "저혈압";
    } else if (systolic >= 90 && systolic <= 120 && diastolic >= 60 && diastolic <= 80) {
        result = "정상 혈압";
    } else if ((systolic > 120 && systolic <= 140) || (diastolic > 80 && diastolic <= 90)) {
        result = "전단계 고혈압";
    } else {
        result = "고혈압";
    }

    return result;
}

// 건강 조언 생성 함수 구현
std::string CppCode::generateHealthAdvice(int systolic, int diastolic, int age, const std::string &gender, double weight) {
    std::string result;

    if (systolic < 90 || diastolic < 60) {
        result = "건강한 식습관과 충분한 수면을 유지하세요.";
    } else if (systolic >= 90 && systolic <= 120 && diastolic >= 60 && diastolic <= 80) {
        result = "규칙적인 운동과 건강한 식습관을 유지하세요.";
    } else if ((systolic > 120 && systolic <= 140) || (diastolic > 80 && diastolic <= 90)) {
        result = "소금 섭취량을 줄이고 체중 감량을 위해 노력하세요.";
    } else {
        result = "의사와 상담하여 적절한 치료 계획을 수립하세요.";
    }

    result += "\n나이: " + std::to_string(age);
    result += "\n성별: " + gender;
    result += "\n체중: " + std::to_string(weight) + "kg";

    return result;
}

// 합병증 정보 제공 함수 구현
std::string CppCode::possibleComplications(int systolic, int diastolic) {
    std::string result;

    if (systolic > 140 || diastolic > 90) {
        result = "고혈압으로 인한 합병증:\n - 심장병\n - 뇌졸중\n - 신장 질환\n - 시력 손상";
    } else if (systolic < 90 || diastolic < 60) {
        result = "저혈압으로 인한 합병증:\n - 현기증\n - 실신\n - 쇼크";
    } else {
        result = "현재 혈압 상태는 합병증 위험이 낮습니다.";
    }

    return result;
}
