//
//  CppWrapper.h
//  vitalcheck
//
//  Created by junga yang on 2024/05/05.
//


#import <Foundation/Foundation.h>

@interface CppWrapper : NSObject

- (NSString *)diagnoseBloodPressureWithSystolic:(int32_t)systolic diastolic:(int32_t)diastolic;
- (NSString *)generateHealthAdviceWithSystolic:(int32_t)systolic diastolic:(int32_t)diastolic age:(int32_t)age gender:(NSString *)gender weight:(double)weight;
- (NSString *)possibleComplicationsWithSystolic:(int32_t)systolic diastolic:(int32_t)diastolic;

@end
