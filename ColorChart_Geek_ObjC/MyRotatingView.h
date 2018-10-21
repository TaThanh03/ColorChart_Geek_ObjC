//
//  MyRotatingView.h
//  ColorChart_Geek_ObjC
//
//  Created by TA Trung Thanh on 20/10/2018.
//  Copyright © 2018 TA Trung Thanh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyRotatingView : UIView

@property (nonatomic, retain)  UILabel *labelPenultimate;
@property (nonatomic, retain)  UILabel *labelPrevious;
@property (nonatomic, retain)  UILabel *labelCurrent;
@property (nonatomic, retain)  UIButton *buttonPenultimate;
@property (nonatomic, retain)  UIButton *buttonPrevious;
@property (nonatomic, retain)  UIView *viewCurrent;
@property (nonatomic, retain)  UILabel *labelR;
@property (nonatomic, retain)  UILabel *labelV;
@property (nonatomic, retain)  UILabel *labelB;
@property (nonatomic, retain)  UISlider *sliderR;
@property (nonatomic, retain)  UISlider *sliderV;
@property (nonatomic, retain)  UISlider *sliderB;
@property (nonatomic, retain)  UIButton *buttonMemorize;
@property (nonatomic, retain)  UIButton *buttonReset;
@property (nonatomic, retain)  UISwitch *switchMode;
@property (nonatomic, retain)  UILabel *labelSwitch;

- (void) drawInFormat: (CGSize) format;
@end

NS_ASSUME_NONNULL_END
