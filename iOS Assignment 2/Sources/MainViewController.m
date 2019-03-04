//
//  MainViewController.m
//  iOS Assignment 2
//
//  Created by Will Powers on 3/1/19.
//  Copyright © 2019 Will Powers. All rights reserved.
//

#import "MainViewController.h"
#import "Course.h"
#import "Student_Info.h"
#import "DisplayViewController.h"

@interface MainViewController ()
@property Course * course;
@property int currIndex;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *midterm;
@property (weak, nonatomic) IBOutlet UITextField *final;
@property (weak, nonatomic) IBOutlet UITextField *hw1;
@property (weak, nonatomic) IBOutlet UITextField *hw2;
@property (weak, nonatomic) IBOutlet UITextField *hw3;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedController;
@property (weak, nonatomic) IBOutlet UIButton *addStudentButton;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property int currSegment;
@property (weak, nonatomic) IBOutlet UILabel *fieldsNotSet;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;
@property (weak, nonatomic) IBOutlet UISlider *sliderValue;




-(void) getStudent: (int) LorR;
-(void) loadUpdateView;
-(void) loadDisplayView;
-(void) loadNewStudentView;

@end

@implementation MainViewController
@synthesize course;
@synthesize currIndex;
- (IBAction)NextStudent:(id)sender {
    
    
    [self updateStudent];
    [self getStudent:1];
    self.sliderValue.value=currIndex;
}
- (IBAction)PreviousStudent:(id)sender {
    
    [self updateStudent];
    [self getStudent:-1];
    self.sliderValue.value=currIndex;
}

- (IBAction)ChangeView:(id)sender {
    
    if(self.currSegment==0){
        [self updateStudent];
    }
    
    switch (_segmentedController.selectedSegmentIndex) {
        case 0:
            [self loadUpdateView];
            break;
        case 1:
            [self loadDisplayView];
            break;
        case 2:
            [self loadNewStudentView];
            break;
    }
    
}


-(void) loadUpdateView{
    self.backgroundView.hidden= YES;
    self.addStudentButton.hidden=YES;
    self.rightButton.hidden= NO;
    self.leftButton.hidden= NO;
    self.sliderValue.hidden=NO;
    
    [self getStudent:0];

    _currSegment = 0;
}

-(void) loadDisplayView{
    
    [self performSegueWithIdentifier: @"DisplayStudent" sender: nil];
    _segmentedController.selectedSegmentIndex = _currSegment;
    
}

-(void) loadNewStudentView{
    self.backgroundView.hidden= NO;
    self.sliderValue.hidden=YES;
    
    _currSegment = 2;
    
    self.name.text = nil;
    self.address.text = nil;
    self.midterm.text = nil;
    self.final.text = nil;
    self.hw1.text = nil;
    self.hw2.text = nil;
    self.hw3.text = nil;
    self.addStudentButton.hidden=NO;
    self.leftButton.hidden=YES;
    self.rightButton.hidden=YES;
    
}

-(void) getStudent: (int) LorR{
    
    self.addStudentButton.hidden=YES;
    self.fieldsNotSet.hidden=YES;
    
    int arrLength = (int)[[course glossary] count];
    
    currIndex += LorR;
    
    if(currIndex== arrLength-1){
        [self.rightButton setEnabled:NO];
    }else{
       [self.rightButton setEnabled:YES];
    }
    if(currIndex== 0){
        [self.leftButton setEnabled:NO];
    }else{
        [self.leftButton setEnabled:YES];
    }
    
    
    Student_Info* currStudent = [course getStudent:currIndex];
    
    self.name.text = [currStudent name];
    self.address.text= [currStudent address];
    self.midterm.text = [currStudent midtermExam];
    self.final.text = [currStudent finalExam];
    self.hw1.text = [currStudent hw1];
    self.hw2.text = [currStudent hw2];
    self.hw3.text = [currStudent hw3];
}

- (IBAction)addNewStudent:(id)sender {
    
    //CHECK IF all the fields aren't filled out
    if ([self checkForUnfilled]){
        self.fieldsNotSet.hidden=NO;
        return;
    }
    self.fieldsNotSet.hidden=YES;
    
    self.sliderValue.maximumValue = self.course.glossary.count;
    
    
    
    [course Add_Student:self.name.text Address:self.address.text Midterm:self.midterm.text Final:self.final.text HW1:self.hw1.text HW2:self.hw2.text HW3:self.hw3.text];
    
    [self loadNewStudentView];
    
}

- (void)updateStudent{
    //CHECK IF all the fields aren't filled out
    [course Set_Student:self.name.text Address:self.address.text Midterm:self.midterm.text Final:self.final.text HW1:self.hw1.text HW2:self.hw2.text HW3:self.hw3.text AtIndex:currIndex];
    
}


-(BOOL) checkForUnfilled{
    
    if ([self.name.text isEqualToString:@""]) return true;
    if( [self.address.text isEqualToString:@""]) return true;
    if ([self.midterm.text isEqualToString:@""]) return true;
    if ([self.final.text isEqualToString:@""]) return true;
    if ([self.hw1.text isEqualToString:@""]) return true;
    if ([self.hw2.text isEqualToString:@""]) return true;
    if ([self.hw3.text isEqualToString:@""]) return true;
    return false;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setCourse:[Course new]];
    
    [course Add_Student:@"Prince William" Address:@"Buckingham Palace" Midterm:@"37.2" Final:@"76.53" HW1:@"7" HW2:@"4" HW3:@"10"];
    
    [self loadUpdateView];
    
}
- (IBAction)slider:(id)sender {
    int index = round(self.sliderValue.value);
    int diff = index-currIndex;
    
    [self updateStudent];
    [self getStudent:diff];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    DisplayViewController *vc = [segue destinationViewController];
    // Pass the selected object to the new view controller.
    [vc setStudent:[course getStudent:currIndex]];
}


@end
