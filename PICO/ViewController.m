//
//  ViewController.m
//  PICO
//
//  Created by 山本文子 on 2014/06/27.
//  Copyright (c) 2014年 山本文子. All rights reserved.
//

#import "ViewController.h"
#import "DMCrookedSwipeView.h"

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


- (UIImage *)setColor
{
    int randomNumber = arc4random_uniform(4);
    NSLog(@"randmNumber is %d", randomNumber);
    
    switch (randomNumber) {
        case 0:
            return [UIImage imageNamed:@"marumaruBlue.png"];
            break;
        case 1:
            return [UIImage imageNamed:@"marumaruGreen.png"];
            break;
        case 2:
            return [UIImage imageNamed:@"marumaruPink.png"];
            break;
        case 3:
            return [UIImage imageNamed:@"marumaruYellow.png"];
            break;
        default:
            break;
    }
    return nil;
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
    
    if(sumiColor == colorNum){
        [UIView beginAnimations:nil context:nil]; //アニメーションの設定開始
        [UIView setAnimationDuration:0.6]; //アニメーションは0.6秒
        DMCrookedSwipeView *marble = [[DMCrookedSwipeView alloc] initWithFrame:CGRectMake(310,134, MARBLE_WIDTH, MARBLE_HEIGHT)];
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

    
    if(sumiColor == colorNum){
        
        [UIView beginAnimations:nil context:nil]; //アニメーションの設定開始
        [UIView setAnimationDuration:0.6]; //アニメーションは0.6秒
        DMCrookedSwipeView *marble = [[DMCrookedSwipeView alloc] initWithFrame:CGRectMake(10,434, MARBLE_WIDTH, MARBLE_HEIGHT)];
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
    
    if(sumiColor == colorNum){
        [UIView beginAnimations:nil context:nil]; //アニメーションの設定開始
        [UIView setAnimationDuration:0.6]; //アニメーションは0.6秒
        DMCrookedSwipeView *marble = [[DMCrookedSwipeView alloc] initWithFrame:CGRectMake(10,134, MARBLE_WIDTH, MARBLE_HEIGHT)];
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
    
    if(sumiColor == colorNum){
        [UIView beginAnimations:nil context:nil]; //アニメーションの設定開始
        [UIView setAnimationDuration:0.6]; //アニメーションは0.6秒
        DMCrookedSwipeView *marble = [[DMCrookedSwipeView alloc] initWithFrame:CGRectMake(320,430, MARBLE_WIDTH, MARBLE_HEIGHT)];
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
//    for ( DMCrookedSwipeView *marble in [self.view subviews]) {
//        [ marble removeFromSuperview];
//    }
    //DMCrookedSwipeView *marble = nil; //maru[0]を空にする（maru[i]にしたい）飛ばした丸だけを更新するため。
}

-(void)add:(CGRect)rect{
    
    NSLog(@"動かされたmarbleの座標は%@です", NSStringFromCGRect(rect));
    
    //[self color];
    [self setColor];
    
    
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
    DMCrookedSwipeView *marble = [[DMCrookedSwipeView alloc] initWithFrame:CGRectMake(110,190, MARBLE_WIDTH, MARBLE_HEIGHT)];
    marble.image= [self setColor];
    marble.userInteractionEnabled = YES; //タッチイベントを許可する
    [self.view addSubview:marble];
}

- (void)makeRightUpwordMaru
{
    DMCrookedSwipeView *marble = [[DMCrookedSwipeView alloc] initWithFrame:CGRectMake(160,190, MARBLE_WIDTH, MARBLE_HEIGHT)];
    
    marble.image= [self setColor];
/*====画像がついてないから丸が表示されない====*/
    //Property 'A:image' not found on object of type 'B:DMCrookedSwipeView'
    //B（データ型やクラス型）型の A というプロパティ名の物が見つかりません。
    /*解決方法*/
    //プロパティ宣言に失敗しています。h.ファイル内の＠interface~@endの中で宣言した＠propatyのコードをよくチェックして見て下さい。プロパティ名をミスっているかもしれません。
    
    marble.userInteractionEnabled = YES; //タッチイベントを許可する
    [self.view addSubview:marble];
}

- (void)makeLeftDownwordMaru
{
    DMCrookedSwipeView *marble = [[DMCrookedSwipeView alloc] initWithFrame:CGRectMake(110,240, MARBLE_WIDTH, MARBLE_HEIGHT)];
    marble.image= [self setColor];
    marble.userInteractionEnabled = YES; //タッチイベントを許可する
    [self.view addSubview:marble];
}

- (void)makeRightDownwordMaru
{
    DMCrookedSwipeView *marble = [[DMCrookedSwipeView alloc] initWithFrame:CGRectMake(160,240, MARBLE_WIDTH, MARBLE_HEIGHT)];
    marble.image= [self setColor];
    marble.userInteractionEnabled = YES; //タッチイベントを許可する
    [self.view addSubview:marble];}

@end
