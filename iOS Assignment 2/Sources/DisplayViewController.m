//
//  DisplayViewController.m
//  iOS Assignment 2
//
//  Created by Will Powers on 3/1/19.
//  Copyright © 2019 Will Powers. All rights reserved.
//

#import "DisplayViewController.h"

@interface DisplayViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation DisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.name.text=self.student.name;
    self.address.text=self.student.address;
    self.name.enabled = NO;
    self.address.enabled = NO;
    self.imageView.image = [UIImage imageNamed:[self.student image]];
    self.name.backgroundColor = [UIColor whiteColor];
    self.address.backgroundColor = [UIColor whiteColor];

}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        //Stuff after dismissing
    }];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
