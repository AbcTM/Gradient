//
//  CustomView.m
//  test
//
//  Created by tm on 2018/7/8.
//  Copyright © 2018年 tm. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [self drawGradient];
}



- (void)drawGradient {
    
    // 创建色彩空间对象
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    // 创建起点和终点颜色分量的数组
    CGFloat colors[] =
    {
        1, 0, 0, 1.00,//start color(r,g,b,alpha)
        255, 255, 255, 1.00,//end color
    };
    
    //形成梯形，渐变的效果
    CGGradientRef gradient = CGGradientCreateWithColorComponents
    (rgb, colors, NULL, 2);
    
    //    NSLog(@"%lu",sizeof(colors)/(sizeof(colors[0])*4));
    
    // 起点颜色起始圆心
    CGPoint start = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    // 终点颜色起始圆心
    CGPoint end = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    // 起点颜色圆形半径
    CGFloat startRadius = 0.0f;
    // 终点颜色圆形半径
    CGFloat endRadius = 100;
    // 获取上下文
    CGContextRef graCtx = UIGraphicsGetCurrentContext();
    // 创建一个径向渐变
    CGContextDrawRadialGradient(graCtx, gradient, start, startRadius, end, endRadius, 0);
    
    //releas
    CGGradientRelease(gradient);
    gradient=NULL;
    CGColorSpaceRelease(rgb);
}


@end
