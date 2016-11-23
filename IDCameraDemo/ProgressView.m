//
//  ProgressView.m
//  IDCameraDemo
//
//  Created by 公安信息 on 16/10/31.
//  Copyright © 2016年 zhangyanxiao. All rights reserved.
//

#import "ProgressView.h"
#import "Masonry.h"

@implementation ProgressView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_setupViews];
    }
    return self;
}

- (void)p_setupViews
{
    self.progressTitleLabel = [[UILabel alloc] init];

    self.progressTitleLabel.textAlignment = NSTextAlignmentLeft;
    self.progressTitleLabel.textColor = [UIColor colorWithRed:166/255.0 green:166/255.0 blue:166/255.0 alpha:1];
    [self addSubview:self.progressTitleLabel];
    
    self.progressAccountLabel =  [[UILabel alloc] init];
    self.progressAccountLabel.textColor = [UIColor colorWithRed:166/255.0 green:166/255.0 blue:166/255.0 alpha:1];
    self.progressAccountLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.progressAccountLabel];
    

    self.rateProgressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    self.rateProgressView.trackTintColor = [UIColor colorWithRed:199/255.0 green:198/255.0 blue:198/255.0 alpha:1];
    self.rateProgressView.layer.masksToBounds = YES;
    self.rateProgressView.layer.cornerRadius = 1;
    
    [self addSubview:self.rateProgressView];

}

- (void)layoutSubviews
{
    
    [super layoutSubviews];
    [self.progressTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(30);
        
        
    }];
    [self.progressAccountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    [self.rateProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(self);
        make.top.equalTo(self.progressTitleLabel.mas_bottom).offset(5);
        make.height.mas_equalTo(5);
    }];
}

+ (ProgressView *)progressTitle:(NSString *)title progressAccount:(int)account rateProgress:(CGFloat)rate rateProgressColor:(UIColor *)progressColor
{
    ProgressView * progressView = [[ProgressView alloc] init];
    progressView.progressTitleLabel.text = title;
    progressView.progressAccountLabel.text = [NSString  stringWithFormat:@"%d",account];
    progressView.rateProgressView.progress = rate;
    progressView.rateProgressView.progressTintColor = progressColor;
    return progressView;
}



@end
