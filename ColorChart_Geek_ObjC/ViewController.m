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
        [[v viewCurrent] setBackgroundColor:[UIColor colorWithRed:[[v sliderR] value] green:[[v sliderV] value] blue:[[v sliderB] value] alpha:1]];
    }
}

- (void) actionButtonMemorizetouched: (UIButton*) sender{
    NSLog(@"tick");
    [_curentColor release];
    _curentColor = [[[v viewCurrent] backgroundColor] copy];
    [_thirdColor release];
    _thirdColor = [_secondColor retain];
    [_secondColor release];
    _secondColor = [_curentColor copy];
    [[v buttonPrevious] setBackgroundColor:_secondColor];
    [[v buttonPenultimate] setBackgroundColor:_thirdColor];
}

- (void)actionButtonResettouched:(UIButton *)sender{
    NSLog(@"tock");
    [_curentColor release];
    [[v sliderR] setValue:0.5];
    [[v sliderV] setValue:0.5];
    [[v sliderB] setValue:0.5];
    [self actionSliderchanged:nil];
    _curentColor = UIColor.grayColor;
    [[v viewCurrent] setBackgroundColor:_curentColor];
}

- (void)actionSwitchchanged:(UISwitch *)sender{}

- (void)actionButtonPreviousTouched:(UIButton *)sender{
    CGFloat red = 0.0, green = 0.0, blue = 0.0;
    [[[v buttonPrevious] backgroundColor] getRed:&red green:&green blue:&blue alpha:nil];
    [[v sliderR] setValue:red];
    [[v sliderV] setValue:green];
    [[v sliderB] setValue:blue];
    [self actionSliderchanged:nil];
    [_curentColor release]; //bon ou pas?
    _curentColor = [[[v viewCurrent] backgroundColor] copy];
}

- (void)actionButtonPenultimateTouched:(UIButton *)sender{
    CGFloat red = 0.0, green = 0.0, blue = 0.0;
    [[[v buttonPenultimate] backgroundColor] getRed:&red green:&green blue:&blue alpha:nil];
    [[v sliderR] setValue:red];
    [[v sliderV] setValue:green];
    [[v sliderB] setValue:blue];
    [self actionSliderchanged:nil];
    [_curentColor release]; //bon ou pas?
    _curentColor = [[[v viewCurrent] backgroundColor] copy];
}

@end
