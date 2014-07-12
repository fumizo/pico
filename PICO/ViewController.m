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
    plusScore = 1;
    score = 0;
    scoreLabel.text = @"0";
    
    /*==丸つくる==*/
    [self makeLeftUpwordMaru];
    [self makeLeftDownwordMaru];
    [self makeRightUpwordMaru];
    [self makeRightDownwordMaru];
    
    /*--音--*/
    NSString *path = [[NSBundle mainBundle] pathForResource:@"powan" ofType:@"mp3"] ;
    NSURL *url = [NSURL fileURLWithPath:path] ;
    audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil] ;
    
    /*--octagon--*/
    randomOctagon = arc4random_uniform(2);
    NSLog(@"randomOctagon is...%d",randomOctagon);
    if (randomOctagon == 0 ) {
        octagon.image = [UIImage imageNamed:@"octagon().png"];
    }else if (randomOctagon == 1){
        octagon.image = [UIImage imageNamed:@"octagon()2.png"];
    }
    
    /*--最初の画面--*/
    firstView =[[UIImageView alloc] initWithFrame:CGRectMake (0,0,320,568)];
    firstView.image = [UIImage imageNamed:@"octagon_first.png"];
    [self.view addSubview:firstView];
    
    [self addTapToReturn];  //タップで消す
}

//タップで消す
- (void)addTapToReturn {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doReturn:)];
    [self.view addGestureRecognizer:tap];
}

- (void)doReturn:(UITapGestureRecognizer *)tap {
    
    [firstView removeFromSuperview];
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}


- (void)color{
    
    random0 = arc4random_uniform(4);
    NSLog(@"random0 is %d", random0);
    
    switch (random0) {
        case 0:
            maruView = [UIImage imageNamed:@"marumaruBlue.png"];
            break;
        case 1:
            maruView = [UIImage imageNamed:@"marumaruGreen.png"];
            break;
        case 2:
            maruView = [UIImage imageNamed:@"marumaruPink.png"];
            break;
        case 3:
            maruView = [UIImage imageNamed:@"marumaruYellow.png"];
            break;
        default:
            break;
    }
    
}


-(void)moveview:(UIImageView *)imageView{
    
    //動く速度
    moveX = 5;
    moveY = 5;

    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI/4);
    [marble setTransform:transform];
    
    /* 左上スワイプ */
    UISwipeGestureRecognizer *swipeLeftGesture =
    [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeLeft:)];
    swipeLeftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [marble addGestureRecognizer:swipeLeftGesture];
    
    /* 右上スワイプ */
    UISwipeGestureRecognizer *swipeUpwardGesture =
    [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeUpward:)];
    swipeUpwardGesture.direction = UISwipeGestureRecognizerDirectionUp;
    [marble addGestureRecognizer:swipeUpwardGesture];
    
    /* 左下スワイプ */
    UISwipeGestureRecognizer *swipeDownwardGesture =
    [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeDownward:)];
    swipeDownwardGesture.direction = UISwipeGestureRecognizerDirectionDown;
    [marble addGestureRecognizer:swipeDownwardGesture];
    
    
    /* 右下スワイプ */
    UISwipeGestureRecognizer *swipeRightGesture =
    [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeRight:)];
    swipeRightGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [marble addGestureRecognizer:swipeRightGesture];
}


#pragma mark - Gesture

- (void)swipeUpward:(UISwipeGestureRecognizer *)sender
{
    NSLog(@"右上");
    [audio play] ; //音をならす
    
    
    /*色の番号を決めといて画像に合わせて、場所と色をリンクさせる*/
    if (randomOctagon == 0) {
        sumiColor = 3;
    }else if (randomOctagon == 1){
        sumiColor = 0;
    }

    
    if(sumiColor == random0){
        
        [UIView beginAnimations:nil context:nil]; //アニメーションの設定開始
        [UIView setAnimationDuration:0.6]; //アニメーションは0.6秒
        marble.center=CGPointMake(310, 134);//ここに画像を表示
        [UIView commitAnimations]; //アニメーションの実行

        [self performSelector:@selector(delete) withObject:nil afterDelay:1.0]; //1秒後にviewからdelete
        
        score = score+25;
        plusScore =  plusScore * 3;
        if (plusScore % 27 == 0){
            pScore = 25 * plusScore/27/10;
        }
        perfectScore = score + pScore;
        scoreLabel.text = [NSString stringWithFormat:@"%d",perfectScore];
        
    }else{
        
        plusScore = 1;
        
        /*----！----*/
        NSDictionary *dic= [NSDictionary dictionaryWithObject:sender.view forKey:@"view"];
        
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(moveMarbles:) userInfo:dic repeats:YES];
        [timer fire];
        
        sender.view.tag = 1;
    }
    
    
    //動かしたViewのもともとの位置を取得して、その場所に新しくmarbleを作る
    [self add:sender.view.frame];

}

- (void)swipeDownward:(UISwipeGestureRecognizer *)sender
{
    NSLog(@"左下");
    [audio play] ; //音をならす
    
    if (randomOctagon == 0) {
        sumiColor = 0;
    }else if (randomOctagon == 1){
        sumiColor = 3;
    }

    
    if(sumiColor == random0){
        
        [UIView beginAnimations:nil context:nil]; //アニメーションの設定開始
        [UIView setAnimationDuration:0.6]; //アニメーションは0.6秒
        marble.center=CGPointMake(10, 434);//ここに画像を表示
        [UIView commitAnimations]; //アニメーションの実行
        
        [self performSelector:@selector(delete) withObject:nil afterDelay:1.0]; //1秒後にviewからdelete
        
        score = score+25;
        plusScore =  plusScore * 3;
        if (plusScore % 27 == 0){
            pScore = 25 * plusScore/27/10;
        }
        perfectScore = score + pScore;
        scoreLabel.text = [NSString stringWithFormat:@"%d",perfectScore];
        
    }else{
        
        plusScore = 1;
        
        /*----！----*/
        NSDictionary *dic = [NSDictionary dictionaryWithObject:sender.view forKey:@"view"];
        
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(moveMarbles:) userInfo:dic repeats:YES];
        [timer fire];
        
        sender.view.tag = 2;

    }
    
    
    //動かしたViewのもともとの位置を取得して、その場所に新しくmarbleを作る
    [self add:sender.view.frame];
}



- (void)swipeLeft:(UISwipeGestureRecognizer *)sender
{
    NSLog(@"左上");
    [audio play] ; //音をならす
    
    if (randomOctagon == 0) {
        sumiColor = 1;
    }else if (randomOctagon == 1){
        sumiColor = 2;
    }
    
    if(sumiColor == random0){
        [UIView beginAnimations:nil context:nil]; //アニメーションの設定開始
        [UIView setAnimationDuration:0.6]; //アニメーションは0.6秒
        marble.center=CGPointMake(10, 134);//ここに画像を表示
        [UIView commitAnimations]; //アニメーションの実行

        [self performSelector:@selector(delete) withObject:nil afterDelay:1.0]; //1秒後にviewからdelete
        
        score = score+25;
        plusScore =  plusScore * 3;
        if (plusScore % 27 == 0){
            pScore = 25 * plusScore/27/10;
        }
        perfectScore = score + pScore;
        scoreLabel.text = [NSString stringWithFormat:@"%d",perfectScore];
    }else{
        
        plusScore = 1;
        
        /*----！----*/
        NSDictionary *dic = [NSDictionary dictionaryWithObject:sender.view forKey:@"view"];
        
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(moveMarbles:) userInfo:dic repeats:YES];
        [timer fire];
        
        sender.view.tag = 3;

    }
    
    
    //動かしたViewのもともとの位置を取得して、その場所に新しくmarbleを作る
    [self add:sender.view.frame];
}


- (void)swipeRight:(UISwipeGestureRecognizer *)sender
{
    NSLog(@"右下");
    [audio play] ; //音をならす
    
    if (randomOctagon == 0) {
        sumiColor = 2;
    }else if (randomOctagon == 1){
        sumiColor = 1;
    }
    
    if(sumiColor == random0){
        [UIView beginAnimations:nil context:nil]; //アニメーションの設定開始
        [UIView setAnimationDuration:0.6]; //アニメーションは0.6秒
        marble.center=CGPointMake(320, 430);//ここに画像を表示
        [UIView commitAnimations]; //アニメーションの実行
        
        [self performSelector:@selector(delete) withObject:nil afterDelay:1.0]; //1秒後にviewからdelete
        
        score = score+25;
        plusScore =  plusScore * 3;
        if (plusScore % 27 == 0){
            pScore = 25 * plusScore/27/10;
        }
        perfectScore = score + pScore;
        scoreLabel.text = [NSString stringWithFormat:@"%d",perfectScore];
    }else{
        
        plusScore = 1;
        
        /*----！----*/
        NSDictionary *dic = [NSDictionary dictionaryWithObject:sender.view forKey:@"view"];
        
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(moveMarbles:) userInfo:dic repeats:YES];
        [timer fire];
        
        sender.view.tag = 4;

    }
    
    //動かしたViewのもともとの位置を取得して、その場所に新しくmarbleを作る
    [self add:sender.view.frame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)delete{
    [marble removeFromSuperview];
    marble = nil; //maru[0]を空にする（maru[i]にしたい）飛ばした丸だけを更新するため。
}

-(void)add:(CGRect)rect{
    
    NSLog(@"動かされたmarbleの座標は%@です", NSStringFromCGRect(rect));
    
    [self color];
    
//    /*==丸つくる==*/
//    if (rect.origin.x < 100 && rect.origin.y <180) {
//        //左上
//        NSLog(@"左上");
//        [self makeLeftUpwordMaru];
//    }else if(rect.origin.x > 145 && rect.origin.y <180){
//        //右上
//        NSLog(@"右上");
//        [self makeRightUpwordMaru];
//    }else if(rect.origin.x > 145 && rect.origin.y >225){
//        //右下
//        NSLog(@"左下");
//        [self makeRightDownwordMaru];
//    }else if(rect.origin.x < 100 && rect.origin.y >225) {
//        //左下
//        NSLog(@"左下");
//        [self makeLeftDownwordMaru];
//    }
    
}

/*----マーブル作る----*/
- (void)makeLeftUpwordMaru
{
    //DMCrookedSwipeView *marble = [[DMCrookedSwipeView alloc] initWithFrame:CGRectMake(100, 220, MARBLE_WIDTH, MARBLE_HEIGHT)];
    marble = [[UIImageView alloc] initWithFrame:CGRectMake(110, 190, 50, 50)];
    
    //[self.view addSubview:marble];
    [self color];
    marble.image = maruView;
    marble.userInteractionEnabled = YES; //タッチイベントを許可する
    
    [self moveview:marble];
    
    [self.view addSubview:marble];
}

- (void)makeRightUpwordMaru
{
    marble = [[UIImageView alloc] initWithFrame:CGRectMake(160, 190, 50, 50)];
    [self color];
    marble.image = maruView;
    marble.userInteractionEnabled = YES;
    
    [self moveview:marble];
    
    [self.view addSubview:marble];
}

- (void)makeLeftDownwordMaru
{
    marble = [[UIImageView alloc] initWithFrame:CGRectMake(110, 240, 50, 50)];
    [self color];
    marble.image = maruView;
    marble.userInteractionEnabled = YES;
    
    [self moveview:marble];
    
    [self.view addSubview:marble];
}

- (void)makeRightDownwordMaru
{
    marble = [[UIImageView alloc] initWithFrame:CGRectMake(160, 240, 50, 50)];
    [self color];
    marble.image = maruView;
    marble.userInteractionEnabled = YES;
    
    [self moveview:marble];
    
    [self.view addSubview:marble];
}



- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    /* ジェスチャーの同時認識を可能に */
    return YES;
}

- (void)moveMarbles:(NSTimer *)timer
{
    NSDictionary *dic = [timer userInfo];
    UIImageView *swipedView = [dic objectForKey:@"view"];

    if (swipedView.tag == 1) {
        swipedView.center = CGPointMake(swipedView.center.x + moveX, swipedView.center.y - moveY);
        // ballと横壁の当たり判定
        if(swipedView.center.x - swipedView.bounds.size.width / 2 < 10) moveX = - moveX;
        if(swipedView.center.x + swipedView.bounds.size.width / 2 > 310) moveX = - moveX;
        
        //上下の壁との当たり判定
        if(swipedView.center.y - swipedView.bounds.size.height / 2 < 134) moveY = - moveY;
        if(swipedView.center.y + swipedView.bounds.size.height / 2 > 434) moveY = - moveY;
        
    }else if (swipedView.tag == 2){
        swipedView.center = CGPointMake(swipedView.center.x + moveX, swipedView.center.y + moveY);
        // ballと横壁の当たり判定
        if(swipedView.center.x - swipedView.bounds.size.width / 2 < 10) moveX = - moveX;
        if(swipedView.center.x + swipedView.bounds.size.width / 2 > 310) moveX = - moveX;
        
        //上下の壁との当たり判定
        if(swipedView.center.y - swipedView.bounds.size.height / 2 < 134) moveY = - moveY;
        if(swipedView.center.y + swipedView.bounds.size.height / 2 > 310) moveY = - moveY;
        
    }else if (swipedView.tag == 3){
        swipedView.center = CGPointMake(swipedView.center.x - moveX, swipedView.center.y + moveY);
        // ballと横壁の当たり判定
        if(swipedView.center.x - swipedView.bounds.size.width / 2 < 10) moveX = - moveX;
        if(swipedView.center.x + swipedView.bounds.size.width / 2 > 310) moveX = - moveX;
        
        //上下の壁との当たり判定
        if(swipedView.center.y - swipedView.bounds.size.height / 2 < 134) moveY = - moveY;
        if(swipedView.center.y + swipedView.bounds.size.height / 2 > 434) moveY = - moveY;
        
    }else if (swipedView.tag == 4){
        swipedView.center = CGPointMake(swipedView.center.x - moveX, swipedView.center.y - moveY);
        // ballと横壁の当たり判定
        if(swipedView.center.x - swipedView.bounds.size.width / 2 < 10) moveX = - moveX;
        if(swipedView.center.x + swipedView.bounds.size.width / 2 > 310) moveX = - moveX;
        
        //上下の壁との当たり判定
        if(swipedView.center.y - swipedView.bounds.size.height / 2 < 134) moveY = - moveY;
        if(swipedView.center.y + swipedView.bounds.size.height / 2 > 434) moveY = - moveY;
    }
}
@end
