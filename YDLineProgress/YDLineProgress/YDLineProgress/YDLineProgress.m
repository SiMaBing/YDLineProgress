//
//  YDLineProgress.m
//  CPJ
//
//  Created by 司亚冰 on 2017/5/12.
//  Copyright © 2017年 SP. All rights reserved.
//

#import "YDLineProgress.h"
#define LineHeight 10.f
#define Space 8.f
#define LineWidth  2.f
// 获得RGB颜色
#define IWColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface YDLineProgress ()
{
    CAShapeLayer *_progressLayer;
}
@end

@implementation YDLineProgress

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        [self drawBgLines];
        [self drawProgressLines];
    }
    return self;
}

//绘制背景线条
- (void)drawBgLines
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineCapStyle = kCGLineCapButt;
    [path moveToPoint:CGPointMake(2, self.frame.size.height/2-LineHeight/2)];
    [path addLineToPoint:CGPointMake(self.frame.size.width-4, self.frame.size.height/2-LineHeight/2)];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.strokeColor = IWColor(221, 234, 240).CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = LineHeight;
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:LineWidth],
                                    [NSNumber numberWithInt:Space],nil]];
    [self.layer addSublayer:shapeLayer];
    
}
//绘制进度线条
- (void)drawProgressLines
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineCapStyle = kCGLineCapButt;
    [path moveToPoint:CGPointMake(2, self.frame.size.height/2-LineHeight/2)];
    [path addLineToPoint:CGPointMake(self.frame.size.width-4, self.frame.size.height/2-LineHeight/2)];
    
    _progressLayer = [CAShapeLayer layer];
    _progressLayer.path = path.CGPath;
    _progressLayer.strokeColor = [UIColor redColor].CGColor;
    _progressLayer.fillColor = [UIColor clearColor].CGColor;
    _progressLayer.lineWidth = LineHeight;
    [_progressLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:LineWidth],
                                        [NSNumber numberWithInt:Space],nil]];
    _progressLayer.strokeStart = 0;
    //设置渐变颜色
    CAGradientLayer *gradientLayer =  [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    [gradientLayer setColors:[NSArray arrayWithObjects:(id)[IWColor(48, 159, 217) CGColor],(id)[IWColor(166, 234, 240) CGColor], nil]];
    gradientLayer.startPoint = CGPointMake(0, 1);
    gradientLayer.endPoint = CGPointMake(1, 0);
    [gradientLayer setMask:_progressLayer]; //用progressLayer来截取渐变层
    [self.layer addSublayer:gradientLayer];
    
}


- (void)setProgress:(CGFloat)progress {
    
    if (progress >= 100.f) {
        _progress = 100.f;
    }
    _progress = progress/100.0;
    _progressLayer.strokeEnd = _progress;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 2 * _progress;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    animation.fromValue=[NSNumber numberWithFloat:0.0f];
    animation.toValue=[NSNumber numberWithFloat:_progress];
    
    animation.autoreverses=NO;
    [_progressLayer addAnimation:animation forKey:@"strokeEndAnimation"];
    
}




@end
