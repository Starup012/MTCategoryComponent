//
//  MTViewController.m
//  MTCategoryComponent
//
//  Created by Tom on 01/09/2021.
//  Copyright (c) 2021 Tom. All rights reserved.
//

#import "MTViewController.h"
#import <MTCategoryComponent/MTCategoryComponentHeader.h>
@interface MTViewController ()

@end

@implementation MTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIView * testView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
     [testView mt_setTopCornerWithRadius:15 bgColor:[UIColor whiteColor]];
    testView.layer.shadowColor = [UIColor mt_colorWithHex:0xD5E0F3].CGColor;
    testView.layer.shadowOffset = CGSizeMake(0,5);
    testView.layer.shadowOpacity = 1;
    testView.layer.shadowRadius = 10;
    testView.layer.cornerRadius = 10;
    
    [self.view addSubview:testView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
