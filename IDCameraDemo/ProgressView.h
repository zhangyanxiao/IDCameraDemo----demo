//
//  ProgressView.h
//  IDCameraDemo
//
//  Created by 公安信息 on 16/10/31.
//  Copyright © 2016年 zhangyanxiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

@interface ProgressView : UIView

@property (nonatomic, strong) UILabel * progressTitleLabel;
@property (nonatomic, strong) UILabel * progressAccountLabel;
@property (nonatomic, strong) UIProgressView * rateProgressView;


+ (ProgressView *)progressTitle:(NSString *)title progressAccount:(int)account rateProgress:(CGFloat)rate rateProgressColor:(UIColor *)progressColor;


@end
