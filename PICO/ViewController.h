//
//  ViewController.h
//  PICO
//
//  Created by 山本文子 on 2014/06/27.
//  Copyright (c) 2014年 山本文子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "DMCrookedSwipeView.h"
#define MARBLE_WIDTH 50
#define MARBLE_HEIGHT 50


//protocolを宣言しておく
@protocol SampleDelegate;


@interface ViewController : UIViewController {
    
    //デリゲートを登録
    id<SampleDelegate>_delegate;

    
    UIImage *maruView; //丸につける画像
    IBOutlet UIImageView *octagon;
    
    AVAudioPlayer *audio;
    
    
    /*丸の色*/
    int random0;

    int colorNum;  //色に番号つけといて、すみからーと合わせる
    int randomOctagon;  //2パターンの八角形
    
    /*---SCORE---*/
    IBOutlet UILabel *scoreLabel;
    int score;        //基本的なスコア
    int plusScore;    //連続で成功したとき足す数を計算する用
    int pScore;       //連続で成功したときに足すスコア
    int perfectScore; //全部足したスコア
    
    UIImageView *firstView;  //最初の画面

}

//デリゲートのプロパティ宣言
@property (nonatomic, assign) id<SampleDelegate> delegate;
//ViewControllerから呼ばれるサンプルメソッド
- (void)add;

@end


#pragma mark delegate prottype
//protocol宣言
@protocol SampleDelegate<NSObject>
//デリゲート経由で呼ばれるメソッドを宣言
@optional
- (void)sample;


@end
