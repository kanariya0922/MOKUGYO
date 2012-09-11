//
//  ViewController.h
//  MOKUGYO
//
//  Created by kanariya0922 on 12/09/10.
//  Copyright (c) 2012年 . All rights reserved.

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController <UIAccelerometerDelegate,AVAudioPlayerDelegate> {
    UILabel *lableX;
    UILabel *labelY;
    UILabel *labelZ;
    int count;
    BOOL isPlay;
}
@property (nonatomic, retain) IBOutlet UILabel *labelX;
@property (nonatomic, retain) IBOutlet UILabel *labelY;
@property (nonatomic, retain) IBOutlet UILabel *labelZ;
@property (retain, nonatomic) IBOutlet UILabel *labelCount;
@end
