//
//  ViewController.m
//  抽屉
//
//  Created by 格式化油条 on 15/5/25.
//  Copyright (c) 2015年 格式化油条. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) UIView *leftView;

@property (nonatomic, weak) UIView *rightView;

@property (nonatomic, weak) UIView *mainView;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *leftView = [[UIView alloc] initWithFrame:self.view.bounds];
    
    leftView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:leftView];
    
    self.leftView = leftView;
    
    UIView *rightView = [[UIView alloc] initWithFrame:self.view.bounds];
    
    rightView.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:rightView];
    
    self.rightView = rightView;
    
    UIView *mainView = [[UIView alloc] initWithFrame:self.view.bounds];
    
    mainView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:mainView];
    
    self.mainView = mainView;
    
    [self.mainView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panView:)]];
    
    [self.mainView addObserver:self forKeyPath:@"transform" options:NSKeyValueObservingOptionNew context:nil];
    
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"transform"])
    {
        if (self.mainView.frame.origin.x > 0)
        {
            self.leftView.hidden = NO;
            
            self.rightView.hidden = YES;
        }
        else if (self.mainView.frame.origin.x < 0)
        {
            self.leftView.hidden = YES;
            
            self.rightView.hidden = NO;
        }
    }
}

- (void) panView:(UIPanGestureRecognizer *) panGesture
{
    
    //    if (panGesture.view.frame.origin.x > 0)
    //    {
    //        self.leftView.hidden = NO;
    //
    //        self.rightView.hidden = YES;
    //    }
    //    else if (panGesture.view.frame.origin.x < 0)
    //    {
    //        self.leftView.hidden = YES;
    //
    //        self.rightView.hidden = NO;
    //    }
    
    //    CGPoint point = [panGesture translationInView:panGesture.view];
    //
    //
    //    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    //
    //    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    //
    //    CGFloat offsetY = point.x * 200 / screenW;
    //
    //    CGFloat scale = (screenH - 2 * offsetY) / screenH;
    //
    //    if (panGesture.view.frame.origin.x < 0)
    //    {
    //        scale *= -1;
    //    }
    //
    //    panGesture.view.transform = CGAffineTransformScale(panGesture.view.transform, 1, scale);
    //
    //    if (panGesture.state == UIGestureRecognizerStateEnded) {
    //        //
    //    }
    //
    //    panGesture.view.transform = CGAffineTransformTranslate(panGesture.view.transform, point.x, point.y);
    //
    //    [panGesture setTranslation:CGPointZero inView:panGesture.view];
    //
    //    scale = 1;
    CGFloat offsetX = [panGesture translationInView:self.view].x;
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    
    CGFloat offsetY = offsetX * 100 / screenW;
    
    if (panGesture.view.frame.origin.x < 0) {
        
        offsetY *= -1;
    }
    
    CGFloat scale = (screenH - 2 * offsetY) / screenH;
    
    if (panGesture.view.frame.origin.y < - 2) {
        
        panGesture.view.transform = CGAffineTransformIdentity;
    }
    else
    {
        panGesture.view.transform = CGAffineTransformScale(CGAffineTransformTranslate(panGesture.view.transform,offsetX, 0), scale, scale);
        
    }
    
    [panGesture setTranslation:CGPointZero inView:panGesture.view];
}

@end
