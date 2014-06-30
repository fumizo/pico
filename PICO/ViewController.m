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
    
//    maruArray[0] = [UIImage imageNamed:@"marumaru.png"];
//    maruArray[1] = [UIImage imageNamed:@"marumaru.png"];
//    maruArray[2] = [UIImage imageNamed:@"marumaru.png"];
//    maruArray[3] = [UIImage imageNamed:@"marumaru.png"];
    
        [self color];
    
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

- (void)color{
    /*---左上の丸---*/
    // 0から3の乱数を生成
    random0 = arc4random_uniform(4);
    NSLog(@"random0...%d",random0);
    if (random == 0) {
        maruArray[0] = [UIImage imageNamed:@"marumaruBlue.png"];
    }else if(random0 ==1){
        maruArray[0] = [UIImage imageNamed:@"marumaruGreen.png"];
    }else if(random0 ==2){
        maruArray[0] = [UIImage imageNamed:@"marumaruPink.png"];
    }else if(random0 ==3){
        maruArray[0] = [UIImage imageNamed:@"marumaruYellow.png"];
    }
    
    /*---右上の丸---*/
    random1 = arc4random_uniform(4);
    NSLog(@"random1...%d",random1);
    if (random1 == 0) {
        maruArray[1] = [UIImage imageNamed:@"marumaruBlue.png"];
    }else if(random1 ==1){
        maruArray[1] = [UIImage imageNamed:@"marumaruGreen.png"];
    }else if(random1 ==2){
        maruArray[1] = [UIImage imageNamed:@"marumaruPink.png"];
    }else if(random1 ==3){
        maruArray[1] = [UIImage imageNamed:@"marumaruYellow.png"];
    }
    
    /*---左下の丸---*/
    random2 = arc4random_uniform(4);
    NSLog(@"random2...%d",random2);
    if (random2 == 0) {
        maruArray[2] = [UIImage imageNamed:@"marumaruBlue.png"];
    }else if(random2 ==1){
        maruArray[2] = [UIImage imageNamed:@"marumaruGreen.png"];
    }else if(random2 ==2){
        maruArray[2] = [UIImage imageNamed:@"marumaruPink.png"];
    }else if(random2 ==3){
        maruArray[2] = [UIImage imageNamed:@"marumaruYellow.png"];
    }
    
    /*---右下の丸---*/
    random3 = arc4random_uniform(4);
    NSLog(@"random3...%d",random3);
    if (random3 == 0) {
        maruArray[3] = [UIImage imageNamed:@"marumaruBlue.png"];
    }else if(random3 ==1){
        maruArray[3] = [UIImage imageNamed:@"marumaruGreen.png"];
    }else if(random3 ==2){
        maruArray[3] = [UIImage imageNamed:@"marumaruPink.png"];
    }else if(random3 ==3){
        maruArray[3] = [UIImage imageNamed:@"marumaruYellow.png"];
    }



}


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
    [UIView beginAnimations:nil context:nil]; //アニメーションの設定開始
    [UIView setAnimationDuration:1]; //アニメーションは1秒
    maru[0].center=CGPointMake(320, 0);//ここに画像を表示
    [UIView commitAnimations]; //アニメーションの実行
    
    [self performSelector:@selector(delete) withObject:nil afterDelay:1.0]; //1秒後にviewからdelete
    [self performSelector:@selector(add) withObject:nil afterDelay:2.0]; //2秒後にviewにadd
    
}

- (void)swipeDownward:(UISwipeGestureRecognizer *)sender
{
    NSLog(@"左下");
    [UIView beginAnimations:nil context:nil]; //アニメーションの設定開始
    [UIView setAnimationDuration:1]; //アニメーションは1秒
    maru[0].center=CGPointMake(0, 568);//ここに画像を表示
    [UIView commitAnimations]; //アニメーションの実行
    
    [self performSelector:@selector(delete) withObject:nil afterDelay:1.0]; //1秒後にviewからdelete
    [self performSelector:@selector(add) withObject:nil afterDelay:2.0]; //2秒後にviewにadd
}


- (void)swipeLeft:(UISwipeGestureRecognizer *)sender
{
    NSLog(@"左上");
    [UIView beginAnimations:nil context:nil]; //アニメーションの設定開始
    [UIView setAnimationDuration:1]; //アニメーションは1秒
    maru[0].center=CGPointMake(0, 0);//ここに画像を表示
    [UIView commitAnimations]; //アニメーションの実行

    [self performSelector:@selector(delete) withObject:nil afterDelay:1.0]; //1秒後にviewからdelete
    [self performSelector:@selector(add) withObject:nil afterDelay:2.0]; //2秒後にviewにadd
}


- (void)swipeRight:(UISwipeGestureRecognizer *)sender
{
    NSLog(@"右下");
    [UIView beginAnimations:nil context:nil]; //アニメーションの設定開始
    [UIView setAnimationDuration:1]; //アニメーションは1秒
    maru[0].center=CGPointMake(320, 568);//ここに画像を表示
    [UIView commitAnimations]; //アニメーションの実行

    [self performSelector:@selector(delete) withObject:nil afterDelay:1.0]; //1秒後にviewからdelete
    [self performSelector:@selector(add) withObject:nil afterDelay:2.0]; //2秒後にviewにadd
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)delete{
    [maru[0] removeFromSuperview];
}

-(void)add{
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
    [self color];
}


@end
