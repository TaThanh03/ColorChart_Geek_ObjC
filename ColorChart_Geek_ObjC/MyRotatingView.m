//
//  MyRotatingView.m
//  ColorChart_Geek_ObjC
//
//  Created by TA Trung Thanh on 20/10/2018.
//  Copyright © 2018 TA Trung Thanh. All rights reserved.
//

#import "MyRotatingView.h"
#import "ViewController.h"

@implementation MyRotatingView

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    //a lot of code here
    if (self) {
        _buttonPenultimate = [[UIButton alloc]init];
        _buttonPrevious = [[UIButton alloc]init];
        _viewCurrent = [[UIView alloc]init];
        _sliderR = [[UISlider alloc]init];
        _sliderV = [[UISlider alloc]init];
        _sliderB = [[UISlider alloc]init];
        _labelR = [[UILabel alloc]init];
        _labelV = [[UILabel alloc]init];
        _labelB = [[UILabel alloc]init];
        _switchMode = [[UISwitch alloc]init];
        
        [self addSubview:_buttonPenultimate];
        [self addSubview:_buttonPrevious];
        [self addSubview:_viewCurrent];
        [self addSubview:_sliderR];
        [self addSubview:_sliderV];
        [self addSubview:_sliderB];
        [self addSubview:_labelR];
        [self addSubview:_labelV];
        [self addSubview:_labelB];
        [self addSubview:_switchMode];
        
        [_buttonPenultimate addTarget:self.superview action:@selector(actionButtonPenultimateTouched:) forControlEvents:UIControlEventTouchDown];
        [_buttonPrevious addTarget:self.superview action:@selector(actionButtonPreviousTouched:) forControlEvents:UIControlEventTouchDown];
        [_buttonMemorize addTarget:self.superview action:@selector(actionButtonMemorizetouched:) forControlEvents:UIControlEventTouchDown];
        [_buttonReset addTarget:self.superview action:@selector(actionButtonResettouched:) forControlEvents:UIControlEventTouchDown];
        [_switchMode addTarget:self.superview action:@selector(actionSwitchchanged:) forControlEvents:UIControlEventValueChanged];
        [_sliderR addTarget:self.superview action:@selector(actionSliderchanged:) forControlEvents:UIControlEventValueChanged];
        [_sliderV addTarget:self.superview action:@selector(actionSliderchanged:) forControlEvents:UIControlEventValueChanged];
        [_sliderB addTarget:self.superview action:@selector(actionSliderchanged:) forControlEvents:UIControlEventValueChanged];
        
        [_buttonPenultimate release];
        [_buttonPrevious release];
        [_viewCurrent release];
        [_sliderR release];
        [_sliderV release];
        [_sliderB release];
        [_labelR release];
        [_labelV release];
        [_labelB release];
        [_switchMode release];
        
        [self drawInFormat:[UIScreen mainScreen].bounds.size];
    }
    return self;
}

- (void) drawInFormat:(CGSize)format {
    //a lot of code here
    //analyse the format, if the height is too short => draw in landscape mode
    if (format.height <  960 ) {
        
    } else {
        
    }
    
}

@end
