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
    
    maruArray[0] = [UIImage imageNamed:@"marumaru.png"];
    maruArray[1] = [UIImage imageNamed:@"marumaru.png"];
    maruArray[2] = [UIImage imageNamed:@"marumaru.png"];
    maruArray[3] = [UIImage imageNamed:@"marumaru.png"];
    //[maru setImage:maruArray[0]];
    
    //maru.frame = CGRectMake(30, 30, 50, 50);
    //[self.view addSubview:maru];
    
    
    for (int i = 0; i < 4; i++) {
        maru[i] = [[UIImageView alloc] init];
        maru[i].image = maruArray[i];
        if (i == 0) {
            maru[i].frame = CGRectMake(110, 190, 50, 50);
            maru[i].userInteractionEnabled = YES;
            [self.view addSubview:maru[i]];
        }else if (i == 1) {
            maru[i].frame = CGRectMake(160, 190, 50, 50);
             maru[i].userInteractionEnabled = YES;
            [self.view addSubview:maru[i]];
        }else if (i == 2) {
            maru[i].frame = CGRectMake(110, 240, 50, 50);
             maru[i].userInteractionEnabled = YES;
            [self.view addSubview:maru[i]];
        }else if (i == 3) {
            maru[i].frame = CGRectMake(160, 240, 50, 50);
             maru[i].userInteractionEnabled = YES;
            [self.view addSubview:maru[i]];
        }

    }
    [self moveview];
}

//#pragma mark - init
//- (id)initWithFrame:(CGRect)frame
//{
////    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code
//        [self moveview];
//    }
//    return self;
//}


-(void)moveview{
    /* 時計回りに45度回転 */
    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI/4);
    for (int i = 0; i < 4; i++) {
        [maru[i] setTransform:transform];
    //d[maru setTransform:transform];
    
    /* 左上スワイプ */
    UISwipeGestureRecognizer *swipeLeftGesture =
    [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeLeft:)];
    swipeLeftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [maru[i] addGestureRecognizer:swipeLeftGesture];
    
    /* 右上スワイプ */
    UISwipeGestureRecognizer *swipeUpwardGesture =
    [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeUpward:)];
    swipeUpwardGesture.direction = UISwipeGestureRecognizerDirectionUp;
    [maru[i] addGestureRecognizer:swipeUpwardGesture];
    
    /* 左下スワイプ */
    UISwipeGestureRecognizer *swipeDownwardGesture =
    [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeDownward:)];
    swipeDownwardGesture.direction = UISwipeGestureRecognizerDirectionDown;
    [maru[i] addGestureRecognizer:swipeDownwardGesture];
    
    
    /* 右下スワイプ */
    UISwipeGestureRecognizer *swipeRightGesture =
    [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeRight:)];
    swipeRightGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [maru[i] addGestureRecognizer:swipeRightGesture];

    }
}


#pragma mark - Gesture

- (void)swipeUpward:(UISwipeGestureRecognizer *)sender
{
    NSLog(@"右上");
}

- (void)swipeDownward:(UISwipeGestureRecognizer *)sender
{
    NSLog(@"左下");
}


- (void)swipeLeft:(UISwipeGestureRecognizer *)sender
{
    NSLog(@"左上");
}


- (void)swipeRight:(UISwipeGestureRecognizer *)sender
{
    NSLog(@"右下");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
