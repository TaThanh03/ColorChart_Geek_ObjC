//
//  ViewController.h
//  ColorChart_Geek_ObjC
//
//  Created by TA Trung Thanh on 20/10/2018.
//  Copyright © 2018 TA Trung Thanh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (void) actionButtonMemorizetouched: (UIButton*) sender;
- (void) actionButtonResettouched: (UIButton*) sender;
- (void) actionSwitchchanged: (UISwitch*) sender;
- (void) actionSliderchanged: (UISlider*) sender;
- (void) actionButtonPenultimateTouched: (UIButton*) sender;
- (void) actionButtonPreviousTouched: (UIButton*) sender;

@end

