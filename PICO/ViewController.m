//
//  ViewController.m
//  PICO
//
//  Created by 山本文子 on 2014/06/27.
//  Copyright (c) 2014年 山本文子. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //maru =[[UIImageView alloc] initWithFrame:CGRectMake (80,284,50,50)];
//    maruArray[1] =[[UIImageView alloc] initWithFrame:CGRectMake (60,234,50,50)];
//    maruArray[2] =[[UIImageView alloc] initWithFrame:CGRectMake (80,234,50,50)];
//    maruArray[3] =[[UIImageView alloc] initWithFrame:CGRectMake (60,284,50,50)];
//    maru.image = [UIImage imageNamed:@"maru.png"];
//    [self.view addSubview:maru];
    
    maruArray[0] = [UIImage imageNamed:@"maru.png"];
    maruArray[1] = [UIImage imageNamed:@"maru.png"];
    maruArray[2] = [UIImage imageNamed:@"maru.png"];
    maruArray[3] = [UIImage imageNamed:@"maru.png"];
    //[maru setImage:maruArray[0]];
    
    //maru.frame = CGRectMake(30, 30, 50, 50);
    //[self.view addSubview:maru];
    
    
    for (int i = 0; i < 4; i++) {
        maru = [[UIImageView alloc] init];
        maru.image = maruArray[i];
        if (i == 0) {
            maru.frame = CGRectMake(110, 190, 50, 50);
            [self.view addSubview:maru];
        }else if (i == 1) {
            maru.frame = CGRectMake(160, 190, 50, 50);
            [self.view addSubview:maru];
        }else if (i == 2) {
            maru.frame = CGRectMake(110, 240, 50, 50);
            [self.view addSubview:maru];
        }else if (i == 3) {
            maru.frame = CGRectMake(160, 240, 50, 50);
            [self.view addSubview:maru];
        }

    }
    
    /* 時計回りに45度回転 */
    CGRect rect = [[UIScreen mainScreen] applicationFrame];
    NSLog(@"%@", NSStringFromCGRect(rect));
    float x = rect.size.width/2;
    float y = rect.size.height/2;
    maru.center = CGPointMake(x, y);
    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI/4);
    [maru setTransform:transform];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
