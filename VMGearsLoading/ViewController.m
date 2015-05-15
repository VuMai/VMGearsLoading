//
//  ViewController.m
//  VMGearsLoading
//
//  Created by Vu Mai on 5/14/15.
//  Copyright (c) 2015 VuMai. All rights reserved.
//

#import "ViewController.h"
#import "VMGearLoadingView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *butShow;
- (IBAction)clickButShow:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadLoadingView];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)loadLoadingView
{
    [VMGearLoadingView showGearLoadingForView:self.view];
    
    [self performSelector:@selector(hideLoadingView) withObject:nil afterDelay:5];
}

-(void)hideLoadingView
{
    [VMGearLoadingView hideGearLoadingForView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickButShow:(id)sender {
    [self loadLoadingView];
}
@end
