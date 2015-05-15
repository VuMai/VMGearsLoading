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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadLoadingView];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)loadLoadingView
{
    VMGearLoadingView *loading = [[VMGearLoadingView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:loading];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
