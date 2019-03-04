//
//  Course.m
//  iOS Assignment 2
//
//  Created by Will Powers on 3/1/19.
//  Copyright © 2019 Will Powers. All rights reserved.
//

#import "Course.h"

@implementation Course
@synthesize glossary;


- (void) Add_Student: (NSString *) name Address: (NSString *) address Midterm: (NSString *) midterm Final: (NSString *) finalExam HW1: (NSString *) hw1 HW2: (NSString *) hw2 HW3: (NSString *) hw3{
    
    if (glossary==nil){
        [self setGlossary:[NSMutableArray new]];
    }
    
    
    Student_Info *temp = [Student_Info new];
    [temp setName: name ];
    [temp setAddress : address ];
    [temp setMidtermExam : midterm ];
    [temp setFinalExam : finalExam ];
    [temp setHw1 : hw1 ];
    [temp setHw2 : hw2 ];
    [temp setHw3 : hw3 ];
    [temp setImage: @"blank.png"];
    
    
    [glossary addObject: temp ];
    
    
}

-(Student_Info *) getStudent: (int) index{
    
    return [glossary objectAtIndex: index];
    
}

- (void) Set_Student: (NSString *) name Address: (NSString *) address Midterm: (NSString *) midterm Final: (NSString *) finalExam HW1: (NSString *) hw1 HW2: (NSString *) hw2 HW3: (NSString *) hw3 AtIndex: (int) index{
    
    
    Student_Info *temp = [glossary objectAtIndex:index];
    [temp setName: name ];
    [temp setAddress : address ];
    [temp setMidtermExam : midterm ];
    [temp setFinalExam : finalExam ];
    [temp setHw1 : hw1 ];
    [temp setHw2 : hw2 ];
    [temp setHw3 : hw3 ];
    
}

@end
