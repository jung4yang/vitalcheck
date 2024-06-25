//
//  CppCode.hpp
//  vitalcheck
//
//  Created by junga yang on 2024/05/05.
//


#ifndef CppCode_hpp
#define CppCode_hpp

#include <string>

class CppCode {
public:
    std::string diagnoseBloodPressure(int systolic, int diastolic);
    std::string generateHealthAdvice(int systolic, int diastolic, int age, const std::string &gender, double weight);
    std::string possibleComplications(int systolic, int diastolic);
};

#endif /* CppCode_hpp */
