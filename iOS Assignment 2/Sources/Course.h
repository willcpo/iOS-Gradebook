//
//  Course.h
//  iOS Assignment 2
//
//  Created by Will Powers on 3/1/19.
//  Copyright © 2019 Will Powers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student_Info.h"

NS_ASSUME_NONNULL_BEGIN

@interface Course : NSObject
@property (nonatomic) NSMutableArray *glossary;

- (void) Add_Student: (NSString *) name Address: (NSString *) address Midterm: (NSString *) midterm Final: (NSString *) finalExam HW1: (NSString *) hw1 HW2: (NSString *) hw2 HW3: (NSString *) hw3;

-(Student_Info *) getStudent: (int) index;
- (void) Set_Student: (NSString *) name Address: (NSString *) address Midterm: (NSString *) midterm Final: (NSString *) finalExam HW1: (NSString *) hw1 HW2: (NSString *) hw2 HW3: (NSString *) hw3 AtIndex: (int) index;

@end

NS_ASSUME_NONNULL_END
