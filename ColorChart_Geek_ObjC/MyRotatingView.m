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
CGFloat outlet_width;
CGFloat outlet_height;
CGFloat border_bottom;
CGFloat border_head;
CGFloat border_side;

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _labelPenultimate = [[UILabel alloc]init];
        _labelPrevious = [[UILabel alloc]init];
        _labelCurrent = [[UILabel alloc]init];
        _buttonPenultimate = [[UIButton alloc]init];
        _buttonPrevious = [[UIButton alloc]init];
        _viewCurrent = [[UIView alloc]init];
        _labelR = [[UILabel alloc]init];
        _labelV = [[UILabel alloc]init];
        _labelB = [[UILabel alloc]init];
        _sliderR = [[UISlider alloc]init];
        _sliderV = [[UISlider alloc]init];
        _sliderB = [[UISlider alloc]init];
        _buttonMemorize = [[UIButton alloc]init];
        _buttonReset = [[UIButton alloc]init];
        _switchMode = [[UISwitch alloc]init];
        _labelSwitch = [[UILabel alloc]init];
        
        [_sliderR setContinuous:YES];
        [_sliderV setContinuous:YES];
        [_sliderB setContinuous:YES];
        [_sliderR setMinimumValue:0];
        [_sliderV setMinimumValue:0];
        [_sliderB setMinimumValue:0];
        [_sliderR setMaximumValue:1];
        [_sliderV setMaximumValue:1];
        [_sliderB setMaximumValue:1];
        
        [_labelPenultimate setText:@"Penultimate"];
        [_labelPenultimate setTextAlignment:NSTextAlignmentCenter];
        [_labelPrevious setText:@"Previous"];
        [_labelPrevious setTextAlignment:NSTextAlignmentCenter];
        [_labelCurrent setText:@"Current"];
        [_labelCurrent setTextAlignment:NSTextAlignmentCenter];
        [_labelSwitch setText:@"Web"];
        [_labelR setText:@"R: 0%"];
        [_labelV setText:@"V: 0%"];
        [_labelB setText:@"B: 0%"];
        
        [_buttonMemorize setTitle:@"Memorize" forState:UIControlStateNormal];
        [_buttonMemorize setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
        [_buttonMemorize setTitleColor:UIColor.redColor forState:UIControlStateHighlighted];
        [_buttonReset setTitle:@"Reset" forState:UIControlStateNormal];
        [_buttonReset setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
        [_buttonReset setTitleColor:UIColor.redColor forState:UIControlStateHighlighted];
        
        [_buttonPenultimate addTarget:self.superview action:@selector(actionButtonPenultimateTouched:) forControlEvents:UIControlEventTouchDown];
        [_buttonPrevious addTarget:self.superview action:@selector(actionButtonPreviousTouched:) forControlEvents:UIControlEventTouchDown];
        [_buttonMemorize addTarget:self.superview action:@selector(actionButtonMemorizetouched:) forControlEvents:UIControlEventTouchDown];
        [_buttonReset addTarget:self.superview action:@selector(actionButtonResettouched:) forControlEvents:UIControlEventTouchDown];
        [_switchMode addTarget:self.superview action:@selector(actionSwitchchanged:) forControlEvents:UIControlEventValueChanged];
        [_sliderR addTarget:self.superview action:@selector(actionSliderchanged:) forControlEvents:UIControlEventValueChanged];
        [_sliderV addTarget:self.superview action:@selector(actionSliderchanged:) forControlEvents:UIControlEventValueChanged];
        [_sliderB addTarget:self.superview action:@selector(actionSliderchanged:) forControlEvents:UIControlEventValueChanged];
        
        [self addSubview:_labelPenultimate];
        [self addSubview:_labelPrevious];
        [self addSubview:_labelCurrent];
        [self addSubview:_buttonPenultimate];
        [self addSubview:_buttonPrevious];
        [self addSubview:_viewCurrent];
        [self addSubview:_labelR];
        [self addSubview:_labelV];
        [self addSubview:_labelB];
        [self addSubview:_sliderR];
        [self addSubview:_sliderV];
        [self addSubview:_sliderB];
        [self addSubview:_buttonMemorize];
        [self addSubview:_buttonReset];
        [self addSubview:_switchMode];
        [self addSubview:_labelSwitch];
        [_labelPenultimate release];
        [_labelPrevious release];
        [_labelCurrent release];
        [_buttonPenultimate release];
        [_buttonPrevious release];
        [_viewCurrent release];
        [_sliderR release];
        [_sliderV release];
        [_sliderB release];
        [_labelR release];
        [_labelV release];
        [_labelB release];
        [_buttonMemorize release];
        [_buttonReset release];
        [_switchMode release];
        [_labelSwitch release];
        
        [self drawInFormat:[UIScreen mainScreen].bounds.size];
    }
    return self;
}

- (void) drawInFormat:(CGSize)format {
    //I have 15*30 + 40 + 50 = 599 = 600 minimum points
    NSLog(@"w %f", format.width);
    NSLog(@"h %f", format.height);
    if (format.height <  540.0 ) {
        //landscape mode
        border_head = 40.0;
        border_bottom = format.height-50.0;
        border_side = format.width/20.0;
        outlet_width = (format.width - border_side*3) /2;
        outlet_height = 30.0;
        [_labelPenultimate  setFrame:CGRectMake( border_side, border_head                  , outlet_width, outlet_height)];
        [_buttonPenultimate setFrame:CGRectMake( border_side, border_head +   outlet_height, outlet_width, outlet_height)];
        [_labelPrevious     setFrame:CGRectMake( border_side, border_head + 2*outlet_height, outlet_width, outlet_height)];
        [_buttonPrevious    setFrame:CGRectMake( border_side, border_head + 3*outlet_height, outlet_width, outlet_height)];
        [_labelCurrent      setFrame:CGRectMake( border_side, border_head + 4*outlet_height, outlet_width, outlet_height)];
        [_viewCurrent       setFrame:CGRectMake( border_side, border_head + 5*outlet_height, outlet_width, outlet_height)];
        [_buttonMemorize    setFrame:CGRectMake( border_side, border_head + 6*outlet_height, outlet_width, outlet_height)];
        
        [_labelR            setFrame:CGRectMake( 2*border_side + outlet_width, border_head, outlet_width, outlet_height)];
        [_sliderR           setFrame:CGRectMake( 2*border_side + outlet_width, border_head +   outlet_height, outlet_width, outlet_height)];
        [_labelV            setFrame:CGRectMake( 2*border_side + outlet_width, border_head + 2*outlet_height, outlet_width, outlet_height)];
        [_sliderV           setFrame:CGRectMake( 2*border_side + outlet_width, border_head + 3*outlet_height, outlet_width, outlet_height)];
        [_labelB            setFrame:CGRectMake( 2*border_side + outlet_width, border_head + 4*outlet_height, outlet_width, outlet_height)];
        [_sliderB           setFrame:CGRectMake( 2*border_side + outlet_width, border_head + 5*outlet_height, outlet_width, outlet_height)];
        [_buttonReset       setFrame:CGRectMake( 2*border_side + outlet_width, border_head + 6*outlet_height, outlet_width, outlet_height)];
        
        [_switchMode        setFrame:CGRectMake( border_side,      border_bottom, outlet_width, outlet_height)];
        [_labelSwitch       setFrame:CGRectMake( border_side + 60, border_bottom, outlet_width, outlet_height)];
        
        
    } else {
        //portrait mode and big screen
        border_head = 40.0;
        border_bottom = format.height-50.0;
        border_side = format.width/15.0;
        outlet_width = format.width - border_side*2;
        outlet_height = 30.0;
        [_labelPenultimate  setFrame:CGRectMake( border_side, border_head                  , outlet_width, outlet_height)];
        [_buttonPenultimate setFrame:CGRectMake( border_side, border_head +   outlet_height, outlet_width, outlet_height)];
        [_labelPrevious     setFrame:CGRectMake( border_side, border_head + 2*outlet_height, outlet_width, outlet_height)];
        [_buttonPrevious    setFrame:CGRectMake( border_side, border_head + 3*outlet_height, outlet_width, outlet_height)];
        [_labelCurrent      setFrame:CGRectMake( border_side, border_head + 4*outlet_height, outlet_width, outlet_height)];
        [_viewCurrent       setFrame:CGRectMake( border_side, border_head + 5*outlet_height, outlet_width,
                                                format.height - border_head - outlet_height*15)];
        [_labelR            setFrame:CGRectMake( border_side, border_bottom - 8*outlet_height, outlet_width, outlet_height)];
        [_sliderR           setFrame:CGRectMake( border_side, border_bottom - 7*outlet_height, outlet_width, outlet_height)];
        [_labelV            setFrame:CGRectMake( border_side, border_bottom - 6*outlet_height, outlet_width, outlet_height)];
        [_sliderV           setFrame:CGRectMake( border_side, border_bottom - 5*outlet_height, outlet_width, outlet_height)];
        [_labelB            setFrame:CGRectMake( border_side, border_bottom - 4*outlet_height, outlet_width, outlet_height)];
        [_sliderB           setFrame:CGRectMake( border_side, border_bottom - 3*outlet_height, outlet_width, outlet_height)];
        [_buttonMemorize    setFrame:CGRectMake( border_side, border_bottom - 2*outlet_height, outlet_width, outlet_height)];
        [_buttonReset       setFrame:CGRectMake( border_side, border_bottom - outlet_height, outlet_width, outlet_height)];
        [_switchMode        setFrame:CGRectMake( border_side,      border_bottom, outlet_width, outlet_height)];
        [_labelSwitch       setFrame:CGRectMake( border_side + 60, border_bottom, outlet_width, outlet_height)];
        
    }
    
}

@end
