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

    
    
    plusScore = 1;
    score = 0;
    scoreLabel.text = @"0";
    
    //[self color];
    
//    for (int i = 0; i < 4; i++) {
//        maru[i] = [[UIImageView alloc] init];
//        maru[i].image = maruArray[i];
//        if (i == 0) {
//            maru[i].frame = CGRectMake(110, 190, 50, 50);
//            maru[i].userInteractionEnabled = YES;  //タッチイベントを許可する
//            [self.view addSubview:maru[i]];
//        }else if (i == 1) {
//            maru[i].frame = CGRectMake(160, 190, 50, 50);
//             maru[i].userInteractionEnabled = YES;
//            [self.view addSubview:maru[i]];
//        }else if (i == 2) {
//            maru[i].frame = CGRectMake(110, 240, 50, 50);
//             maru[i].userInteractionEnabled = YES;
//            [self.view addSubview:maru[i]];
//        }else if (i == 3) {
//            maru[i].frame = CGRectMake(160, 240, 50, 50);
//             maru[i].userInteractionEnabled = YES;
//            [self.view addSubview:maru[i]];
//        }
//    }
    
    [self moveview];
    
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
//    /*---左上の丸---*/
//    // 0から3の乱数を生成
//    random0 = arc4random_uniform(4);
//    NSLog(@"random0...%d",random0);
//    if (random == 0) {
//        maruArray[0] = [UIImage imageNamed:@"marumaruBlue.png"];
//    }else if(random0 ==1){
//        maruArray[0] = [UIImage imageNamed:@"marumaruGreen.png"];
//    }else if(random0 ==2){
//        maruArray[0] = [UIImage imageNamed:@"marumaruPink.png"];
//    }else if(random0 ==3){
//        maruArray[0] = [UIImage imageNamed:@"marumaruYellow.png"];
//    }
//    
//    /*---右上の丸---*/
//    random1 = arc4random_uniform(4);
//    NSLog(@"random1...%d",random1);
//    if (random1 == 0) {
//        maruArray[1] = [UIImage imageNamed:@"marumaruBlue.png"];
//    }else if(random1 ==1){
//        maruArray[1] = [UIImage imageNamed:@"marumaruGreen.png"];
//    }else if(random1 ==2){
//        maruArray[1] = [UIImage imageNamed:@"marumaruPink.png"];
//    }else if(random1 ==3){
//        maruArray[1] = [UIImage imageNamed:@"marumaruYellow.png"];
//    }
//    
//    /*---左下の丸---*/
//    random2 = arc4random_uniform(4);
//    NSLog(@"random2...%d",random2);
//    if (random2 == 0) {
//        maruArray[2] = [UIImage imageNamed:@"marumaruBlue.png"];
//    }else if(random2 ==1){
//        maruArray[2] = [UIImage imageNamed:@"marumaruGreen.png"];
//    }else if(random2 ==2){
//        maruArray[2] = [UIImage imageNamed:@"marumaruPink.png"];
//    }else if(random2 ==3){
//        maruArray[2] = [UIImage imageNamed:@"marumaruYellow.png"];
//    }
//    
//    /*---右下の丸---*/
//    random3 = arc4random_uniform(4);
//    NSLog(@"random3...%d",random3);
//    if (random3 == 0) {
//        maruArray[3] = [UIImage imageNamed:@"marumaruBlue.png"];
//    }else if(random3 ==1){
//        maruArray[3] = [UIImage imageNamed:@"marumaruGreen.png"];
//    }else if(random3 ==2){
//        maruArray[3] = [UIImage imageNamed:@"marumaruPink.png"];
//    }else if(random3 ==3){
//        maruArray[3] = [UIImage imageNamed:@"marumaruYellow.png"];
//    }
    
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


-(void)moveview{
    
    //動く速度
    moveX = 5;
    moveY = 5;
    
    
    /* 時計回りに45度回転 */
    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI/4);
    for (int i = 0; i < 4; i++) {
        [marble setTransform:transform];
    //d[maru setTransform:transform];
    
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
    
    
    [UIView beginAnimations:nil context:nil]; //アニメーションの設定開始
    [UIView setAnimationDuration:0.6]; //アニメーションは0.6秒
    marble.center=CGPointMake(310, 134);//ここに画像を表示
    [UIView commitAnimations]; //アニメーションの実行
    
    if(sumiColor == random0){
        [self performSelector:@selector(delete) withObject:nil afterDelay:1.0]; //1秒後にviewからdelete
        
        score = score+25;
        plusScore =  plusScore * 3;
        if (plusScore % 27 == 0){
            pScore = 25 * plusScore/27/10;
        }
        perfectScore = score + pScore;
        scoreLabel.text = [NSString stringWithFormat:@"%d",perfectScore];
        
    }else{
        marble
        = nil;
        plusScore = 1;
    }
    
    [self performSelector:@selector(add) withObject:nil afterDelay:1.7]; //1.7秒後にviewにadd
    
    
    /*----！----*/
    NSDictionary *dic= [NSDictionary dictionaryWithObject:sender.view forKey:@"view"];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(moveMarbles:) userInfo:dic repeats:YES];
    [timer fire];
    
    sender.view.tag = 1;
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
    
    
    [UIView beginAnimations:nil context:nil]; //アニメーションの設定開始
    [UIView setAnimationDuration:0.6]; //アニメーションは0.6秒
    marble.center=CGPointMake(10, 434);//ここに画像を表示
    [UIView commitAnimations]; //アニメーションの実行
    
    if(sumiColor == random0){
        [self performSelector:@selector(delete) withObject:nil afterDelay:1.0]; //1秒後にviewからdelete
        
        score = score+25;
        plusScore =  plusScore * 3;
        if (plusScore % 27 == 0){
            pScore = 25 * plusScore/27/10;
        }
        perfectScore = score + pScore;
        scoreLabel.text = [NSString stringWithFormat:@"%d",perfectScore];

    }else{
        marble = nil;
        plusScore = 1;
    }

    [self performSelector:@selector(add) withObject:nil afterDelay:1.7]; //17.秒後にviewにadd
    
    /*----！----*/
    NSDictionary *dic = [NSDictionary dictionaryWithObject:sender.view forKey:@"view"];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(moveMarbles:) userInfo:dic repeats:YES];
    [timer fire];

    sender.view.tag = 2;
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
    

    [UIView beginAnimations:nil context:nil]; //アニメーションの設定開始
    [UIView setAnimationDuration:0.6]; //アニメーションは0.6秒
    marble.center=CGPointMake(10, 134);//ここに画像を表示
    [UIView commitAnimations]; //アニメーションの実行

    if(sumiColor == random0){
        [self performSelector:@selector(delete) withObject:nil afterDelay:1.0]; //1秒後にviewからdelete
        
        score = score+25;
        plusScore =  plusScore * 3;
        if (plusScore % 27 == 0){
            pScore = 25 * plusScore/27/10;
        }
        perfectScore = score + pScore;
        scoreLabel.text = [NSString stringWithFormat:@"%d",perfectScore];

        
    }else{
        marble = nil;
        plusScore = 1;
    }

    [self performSelector:@selector(add) withObject:nil afterDelay:1.7]; //17.秒後にviewにadd
    
    /*----！----*/
    NSDictionary *dic = [NSDictionary dictionaryWithObject:sender.view forKey:@"view"];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(moveMarbles:) userInfo:dic repeats:YES];
    [timer fire];

    sender.view.tag = 3;
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

    [UIView beginAnimations:nil context:nil]; //アニメーションの設定開始
    [UIView setAnimationDuration:0.6]; //アニメーションは0.6秒
    marble.center=CGPointMake(320, 430);//ここに画像を表示
    [UIView commitAnimations]; //アニメーションの実行

    if(sumiColor == random0){
        [self performSelector:@selector(delete) withObject:nil afterDelay:1.0]; //1秒後にviewからdelete
        
        score = score+25;
        plusScore =  plusScore * 3;
        if (plusScore % 27 == 0){
            pScore = 25 * plusScore/27/10;
        }
        perfectScore = score + pScore;
        scoreLabel.text = [NSString stringWithFormat:@"%d",perfectScore];

        
    }else{
        marble = nil;
        plusScore = 1;
    }

    [self performSelector:@selector(add) withObject:nil afterDelay:1.7]; //17.秒後にviewにadd
    
    /*----！----*/
    NSDictionary *dic = [NSDictionary dictionaryWithObject:sender.view forKey:@"view"];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(moveMarbles:) userInfo:dic repeats:YES];
    [timer fire];

    sender.view.tag = 4;
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

-(void)add{
    
    [self color];
    
//    for (int i = 0; i < 4; i++) {
//        if (maru[i] == nil) {
//        maru[i] = [[UIImageView alloc] init];
//        maru[i].image = maruArray[i];
//        if (i == 0) {
//            maru[i].frame = CGRectMake(110, 190, 50, 50);
//            maru[i].userInteractionEnabled = YES;
//            [self.view addSubview:maru[i]];
//        }else if (i == 1) {
//            maru[i].frame = CGRectMake(160, 190, 50, 50);
//            maru[i].userInteractionEnabled = YES;
//            [self.view addSubview:maru[i]];
//        }else if (i == 2) {
//            maru[i].frame = CGRectMake(110, 240, 50, 50);
//            maru[i].userInteractionEnabled = YES;
//            [self.view addSubview:maru[i]];
//        }else if (i == 3) {
//            maru[i].frame = CGRectMake(160, 240, 50, 50);
//            maru[i].userInteractionEnabled = YES;
//            [self.view addSubview:maru[i]];
//        }
//        }
//    }
    
    
    /*==丸つくる==*/
    [self makeLeftUpwordMaru];
    [self makeLeftDownwordMaru];
    [self makeRightUpwordMaru];
    [self makeRightDownwordMaru];


    [self moveview];
    
}


/*
//タッチのイベント
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];  //触った座標を所得する
    if ([touch.view isKindOfClass:[UIImageView class]]) {
        //順番を入れ替える
        //[self.view bringSubviewToFront:一番うえにもってきたいビューの変数];
        [self.view bringSubviewToFront:maru[2]];
    }   //それがビューだったら
}
*/


/*----マーブル作る----*/
//これは今までの配列に入れる作り方
//    for (int i = 0; i < 4; i++) {
//        maru[i] = [[UIImageView alloc] init];
//        maru[i].image = maruArray[i];
//        if (i == 0) {
//            maru[i].frame = CGRectMake(110, 190, 50, 50);
//           maru[i].userInteractionEnabled = YES;
//            [self.view addSubview:maru[i]];
//        }else if (i == 1) {
//            maru[i].frame = CGRectMake(160, 190, 50, 50);
//             maru[i].userInteractionEnabled = YES;
//            [self.view addSubview:maru[i]];
//        }else if (i == 2) {
//            maru[i].frame = CGRectMake(110, 240, 50, 50);
//             maru[i].userInteractionEnabled = YES;
//            [self.view addSubview:maru[i]];
//        }else if (i == 3) {
//            maru[i].frame = CGRectMake(160, 240, 50, 50);
//             maru[i].userInteractionEnabled = YES;
//            [self.view addSubview:maru[i]];
//        }
//    }

- (void)makeLeftUpwordMaru
{
    //DMCrookedSwipeView *marble = [[DMCrookedSwipeView alloc] initWithFrame:CGRectMake(100, 220, MARBLE_WIDTH, MARBLE_HEIGHT)];
    UIImageView *marble = [[UIImageView alloc] initWithFrame:CGRectMake(110, 190, 50, 50)];
    
    //[self.view addSubview:marble];
    [self color];
    marble.image = maruView;
    marble.userInteractionEnabled = YES; //タッチイベントを許可する
    [self.view addSubview:marble];
}
//expected method to read array element not found on object of type
//local declaration of  hides instance variable

- (void)makeRightUpwordMaru
{
    UIImageView *marble = [[UIImageView alloc] initWithFrame:CGRectMake(160, 190, 50, 50)];
    [self color];
    marble.image = maruView;
    marble.userInteractionEnabled = YES;
    [self.view addSubview:marble];
}

- (void)makeLeftDownwordMaru
{
    UIImageView *marble = [[UIImageView alloc] initWithFrame:CGRectMake(110, 240, 50, 50)];
    [self color];
    marble.image = maruView;
    marble.userInteractionEnabled = YES;
    [self.view addSubview:marble];
}

- (void)makeRightDownwordMaru
{
    UIImageView *marble = [[UIImageView alloc] initWithFrame:CGRectMake(160, 240, 50, 50)];
    [self color];
    marble.image = maruView;
    
    [self.view addSubview:marble];
}



- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    /* ジェスチャーの同時認識を可能に */
    return YES;
}


/*
- (void)moveMarbles:(NSTimer *)timer
{
    NSDictionary *dic = [timer userInfo];
    UIImageView *swipedView = [dic objectForKey:@"view"];
    
    if (swipedView.tag == 1) {
        swipedView.center = CGPointMake(swipedView.center.x + moveX, swipedView.center.y - moveY);
        // ballと横壁の当たり判定
        if(swipedView.center.x - swipedView.bounds.size.width / 2 < 0) moveX = - moveX;
        if(swipedView.center.x + swipedView.bounds.size.width / 2 >320) moveX = - moveX;
        
        //上下の壁との当たり判定
        if(swipedView.center.y - swipedView.bounds.size.height / 2 < 124) moveY = - moveY;
        if(swipedView.center.y + swipedView.bounds.size.height / 2 > 444) moveY = - moveY;
        
    
    }else if (swipedView.tag == 2){
        swipedView.center = CGPointMake(swipedView.center.x + moveX, swipedView.center.y + moveY);
        // ballと横壁の当たり判定
        if(swipedView.center.x - swipedView.bounds.size.width / 2 < 0) moveX = - moveX;
        if(swipedView.center.x + swipedView.bounds.size.width / 2 > 320) moveX = - moveX;
        
        //上下の壁との当たり判定
        if(swipedView.center.y - swipedView.bounds.size.height / 2 < 124) moveY = - moveY;
        if(swipedView.center.y + swipedView.bounds.size.height / 2 > 444) moveY = - moveY;
        
    }else if (swipedView.tag == 3){
        swipedView.center = CGPointMake(swipedView.center.x - moveX, swipedView.center.y + moveY);
        // ballと横壁の当たり判定
        if(swipedView.center.x - swipedView.bounds.size.width / 2 < 0) moveX = - moveX;
        if(swipedView.center.x + swipedView.bounds.size.width / 2 > 320) moveX = - moveX;
        
        //上下の壁との当たり判定
        if(swipedView.center.y - swipedView.bounds.size.height / 2 < 124) moveY = - moveY;
        if(swipedView.center.y + swipedView.bounds.size.height / 2 > 444) moveY = - moveY;
        
    }else if (swipedView.tag == 4){
        swipedView.center = CGPointMake(swipedView.center.x - moveX, swipedView.center.y - moveY);
        // ballと横壁の当たり判定
        if(swipedView.center.x - swipedView.bounds.size.width / 2 < 0) moveX = - moveX;
        if(swipedView.center.x + swipedView.bounds.size.width / 2 > 320) moveX = - moveX;
        
        //上下の壁との当たり判定
        if(swipedView.center.y - swipedView.bounds.size.height / 2 < 124) moveY = - moveY;
        if(swipedView.center.y + swipedView.bounds.size.height / 2 > 444) moveY = - moveY;
    }
}
 */



@end
