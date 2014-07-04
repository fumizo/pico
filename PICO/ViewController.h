//
//  ViewController.h
//  PICO
//
//  Created by 山本文子 on 2014/06/27.
//  Copyright (c) 2014年 山本文子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController{
    UIImageView *maru[4];
    UIImage *maruArray[4];
    
    IBOutlet UIImageView *octagon;
    
    
    /*丸の色*/
    int random0;
    int random1;
    int random2;
    int random3;
    
    int randomOctagon;
    
    int sumiColor;  //blue0,green1,pink2,yellow3
    
    AVAudioPlayer *audio;
}




@end
