//
//  DMCrookedSwipeView.h
//  DMCrookedSwiper
//
//  Created by Master on 2014/06/15.
//  Copyright (c) 2014年 jp.co.mappy. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <AVFoundation/AVFoundation.h>
#import "ViewController.h"


@interface DMCrookedSwipeView : UIImageView <UIGestureRecognizerDelegate>
{
    //<SampleDelegate>も指定したい
    
    float moveX;
    float moveY;
    
    int torf;   //すみと丸の色が合ってたら１、間違ってたら２
    
    int colorNum;  //色に番号つけといて、すみからーと合わせる
    int randomOctagon;  //2パターンの八角形
    int sumiColor;  //blue0,green1,pink2,yellow3
    //cannot find protocol declaration for
    
    
    /*---SCORE---*/
    int score;        //基本的なスコア
    int plusScore;    //連続で成功したとき足す数を計算する用
    int pScore;       //連続で成功したときに足すスコア
    int perfectScore; //全部足したスコア
    
    //AVAudioPlayer *audio;
}

@property(nonatomic, assign) int randomOctagon;
@property(nonatomic, assign) int colorNum;

@property(nonatomic, assign) int score;
@property(nonatomic, assign) int plusScore;
@property(nonatomic, assign) int pScore;
@property(nonatomic, assign) int perfectScore;



@end
