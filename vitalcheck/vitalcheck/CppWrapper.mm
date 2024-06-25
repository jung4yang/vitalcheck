//
//  CppWrapper.mm
//  vitalcheck
//
//  Created by junga yang on 2024/05/05.
//

#import "CppWrapper.h"
#import "CppCode.hpp"

@implementation CppWrapper

- (NSString *)diagnoseBloodPressureWithSystolic:(int32_t)systolic diastolic:(int32_t)diastolic {
    CppCode cppCode;
    return [NSString stringWithUTF8String:cppCode.diagnoseBloodPressure(systolic, diastolic).c_str()];
}

- (NSString *)generateHealthAdviceWithSystolic:(int32_t)systolic diastolic:(int32_t)diastolic age:(int32_t)age gender:(NSString *)gender weight:(double)weight {
    CppCode cppCode;
    return [NSString stringWithUTF8String:cppCode.generateHealthAdvice(systolic, diastolic, age, gender.UTF8String, weight).c_str()];
}

- (NSString *)possibleComplicationsWithSystolic:(int32_t)systolic diastolic:(int32_t)diastolic {
    CppCode cppCode;
    return [NSString stringWithUTF8String:cppCode.possibleComplications(systolic, diastolic).c_str()];
}

@end
