//
//  ViewController.m
//  ColorChart_Geek_ObjC
//
//  Created by TA Trung Thanh on 20/10/2018.
//  Copyright © 2018 TA Trung Thanh. All rights reserved.
//

#import "ViewController.h"
#import "MyRotatingView.h"

@interface ViewController ()
@property(readwrite,nonatomic,retain) UIColor *curentColor;
@property(readwrite,nonatomic,retain) UIColor *secondColor;
@property(readwrite,nonatomic,retain) UIColor *thirdColor;
@end

MyRotatingView *v;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    v = [[MyRotatingView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [v setBackgroundColor:[UIColor whiteColor]];
    [self setView:v];
    [v release]; //because setView opperation has increase reference counter
    
    [[v sliderR] setContinuous:YES];
    [[v sliderV] setContinuous:YES];
    [[v sliderB] setContinuous:YES];
    
    [[v sliderR] setMinimumValue:0];
    [[v sliderV] setMinimumValue:0];
    [[v sliderB] setMinimumValue:0];
    
    [[v sliderR] setMaximumValue:1];
    [[v sliderV] setMaximumValue:1];
    [[v sliderB] setMaximumValue:1];
    
    _curentColor = UIColor.grayColor;
    _secondColor = UIColor.grayColor;
    _thirdColor = UIColor.grayColor;
    
    [[v viewCurrent] setBackgroundColor:_curentColor];
    [[v buttonPrevious] setBackgroundColor:_secondColor];
    [[v buttonPenultimate] setBackgroundColor:_thirdColor];
}

//This is THE WAY to handle orientation
- (void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [v drawInFormat:size]; //Implement by MyRotatingView
}


- (void) actionSliderchanged: (UISlider*) sender{
    if ([[v switchMode] isOn]){
        int roundedR = (int)(((int)([[v sliderR] value]*100))/10)*10;
        int roundedV = (int)(((int)([[v sliderV] value]*100))/10)*10;
        int roundedB = (int)(((int)([[v sliderB] value]*100))/10)*10;
        [[v labelR] setText:[NSString stringWithFormat:@"R: %d%%", roundedR]];
        [[v labelV] setText:[NSString stringWithFormat:@"V: %d%%", roundedV]];
        [[v labelB] setText:[NSString stringWithFormat:@"B: %d%%", roundedB]];
        float roundedR2 = (float)roundedR/100;
        float roundedV2 = (float)roundedV/100;
        float roundedB2 = (float)roundedB/100;
        [[v viewCurrent] setBackgroundColor:[UIColor colorWithRed:roundedR2 green:roundedV2 blue:roundedB2 alpha:1]];
    } else {
        [[v labelR] setText:[NSString stringWithFormat:@"R: %d%%", (int)([[v sliderR] value]*100)]];
        [[v labelV] setText:[NSString stringWithFormat:@"V: %d%%", (int)([[v sliderV] value]*100)]];
        [[v labelB] setText:[NSString stringWithFormat:@"B: %d%%", (int)([[v sliderB] value]*100)]];
        [[v viewCurrent] setBackgroundColor:[UIColor colorWithRed:[[v sliderR] value]
                                                              green:[[v sliderV] value]
                                                               blue:[[v sliderB] value]
                                                              alpha:1]];
    }
    /*
    if (!_outletSwitch.isOn){
        int roundedR = (int)(((int)(_outletSliderR.value*100))/10)*10;
        int roundedV = (int)(((int)(_outletSliderV.value*100))/10)*10;
        int roundedB = (int)(((int)(_outletSliderB.value*100))/10)*10;
        _outletLabelR.text = [NSString stringWithFormat:@"R: %d%%", roundedR];
        _outletLabelV.text = [NSString stringWithFormat:@"V: %d%%", roundedV];
        _outletLabelB.text = [NSString stringWithFormat:@"B: %d%%", roundedB];
        //NSLog(@"%d", roundedR);
        float roundedR2 = (float)roundedR/100;
        float roundedV2 = (float)roundedV/100;
        float roundedB2 = (float)roundedB/100;
        _outletCurrent.backgroundColor = [UIColor colorWithRed:roundedR2 green:roundedV2 blue:roundedB2 alpha:1];
        
    } else {
        //NSLog(@"%f", _outletSliderR.value);
        _outletLabelR.text = [NSString stringWithFormat:@"R: %d%%", (int)(_outletSliderR.value*100)];
        _outletLabelV.text = [NSString stringWithFormat:@"V: %d%%", (int)(_outletSliderV.value*100)];
        _outletLabelB.text = [NSString stringWithFormat:@"B: %d%%", (int)(_outletSliderB.value*100)];
        _outletCurrent.backgroundColor = [UIColor colorWithRed:_outletSliderR.value green:_outletSliderV.value blue:_outletSliderB.value alpha:1];
    }
    */
}

@end
