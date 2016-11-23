//
//  EnvironmentalScoreViewController.m
//  IDCameraDemo
//
//  Created by 公安信息 on 16/10/28.
//  Copyright © 2016年 zhangyanxiao. All rights reserved.
//

#import "EnvironmentalScoreViewController.h"
#import "UIColor+Hex.h"
#import "Masonry.h"
#import "ProgressView.h"

@interface EnvironmentalScoreViewController ()

@property (nonatomic, strong) UIButton * backButton;
@property (nonatomic, strong) UIButton * nextButton;

@property (nonatomic, strong) UIImageView * photoIMV;
@property (nonatomic, strong) ProgressView * brightnessProgressView;
@property (nonatomic, strong) ProgressView * clothingProgressView;
@property (nonatomic, strong) ProgressView * headProgressView;


@property (nonatomic, strong) UIButton * shootingGuideButton;
@end

@implementation EnvironmentalScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    [self p_setupViews];

}


- (void)p_setupViews{
    UIView * topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor colorWithRed:19/255.0 green:153/255.0 blue:229/255.0 alpha:1];
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(20);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(60);
    }];
    
    UILabel * titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"拍摄环境评分";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:22];
    [topView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(topView);
    }];
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setImage:[UIImage imageNamed:@"返回"] forState:(UIControlStateNormal)];
    [self.backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [topView addSubview:self.backButton];
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topView).offset(20);
        make.width.height.mas_equalTo(30);
        make.centerY.equalTo(topView);
    }];
    [self.backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.nextButton setTitle:@"下一步" forState:(UIControlStateNormal)];
    [self.nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [topView addSubview:self.nextButton];
    [self.nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(topView).offset(-20);
        make.height.mas_equalTo(30);
        make.centerY.equalTo(topView);
    }];
    [self.nextButton addTarget:self action:@selector(nextButtonClicked:) forControlEvents:UIControlEventTouchUpInside];

    
    UIView * middleView = [[UIView alloc] init];
    middleView.backgroundColor = [UIColor colorWithRed:47/255.0 green:169/255.0 blue:241/255.0 alpha:1];
    [self.view addSubview:middleView];
    UIView * bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    [middleView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(topView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(self.view.mas_height).dividedBy(2.5);
        
    }];
    
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(middleView.mas_bottom);
        make.left.and.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
    UIImageView * photoIMV = [[UIImageView alloc] init];
    photoIMV.backgroundColor = [UIColor whiteColor];
    [middleView addSubview:photoIMV];
    self.photoIMV = photoIMV;
    [self.photoIMV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(middleView);
        make.centerY.equalTo(middleView);
        make.top.equalTo(middleView).offset(30);
        make.width.equalTo(middleView).dividedBy(3);
    }];
    
    self.brightnessProgressView = [ProgressView progressTitle:@"照片亮度" progressAccount:90 rateProgress:0.9 rateProgressColor:[UIColor colorWithRed:37/255.0 green:191/255.0 blue:116/255.0 alpha:1]];
    [bottomView addSubview:self.brightnessProgressView];
    [self.brightnessProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(bottomView).offset(20);
        make.right.equalTo(bottomView).offset(-20);
        make.top.equalTo(bottomView).offset(30);
        make.height.mas_equalTo(45);
        
    }];
    
    
    self.clothingProgressView = [ProgressView progressTitle:@"服装突出" progressAccount:70 rateProgress:0.7 rateProgressColor:[UIColor colorWithRed:10/255.0 green:172/255.0 blue:240/255.0 alpha:1]];
    [bottomView addSubview:self.clothingProgressView];
    [self.clothingProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(bottomView).offset(20);
        make.right.equalTo(bottomView).offset(-20);
        make.top.equalTo(self.brightnessProgressView.mas_bottom).offset(30);
        make.height.mas_equalTo(45);
        
    }];
    
    self.headProgressView = [ProgressView progressTitle:@"头部摆正" progressAccount:50 rateProgress:0.5 rateProgressColor:[UIColor colorWithRed:242/255.0 green:145/255.0 blue:34/255.0 alpha:1]];
    [bottomView addSubview:self.headProgressView];
    [self.headProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(bottomView).offset(20);
        make.right.equalTo(bottomView).offset(-20);
        make.top.equalTo(self.clothingProgressView.mas_bottom).offset(30);
        make.height.mas_equalTo(45);
        
    }];
    
    UILabel * lineLabel = [[UILabel alloc] init];
    [bottomView addSubview:lineLabel];
    lineLabel.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    lineLabel.layer.cornerRadius = 1;
    [lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headProgressView.mas_bottom).offset(30);
        make.left.right.equalTo(self.headProgressView);
        make.height.mas_equalTo(5);
    }];
    
    UIView * contentView = [[UIView alloc] init];
    [bottomView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(bottomView);
        make.top.equalTo(lineLabel.mas_bottom);
    }];
    
    UILabel * guideLabel = [[UILabel alloc] init];
    guideLabel.text = @"感觉没拍好,可以查看";
    guideLabel.textColor = [UIColor colorWithRed:144/255.0 green:144/255.0 blue:144/255.0 alpha:1];
    guideLabel.textAlignment = NSTextAlignmentCenter;
    guideLabel.font = [UIFont systemFontOfSize:16];
    [contentView addSubview:guideLabel];
    self.shootingGuideButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.shootingGuideButton setTitle:@"《拍摄指南》" forState:(UIControlStateNormal)];
    [self.shootingGuideButton setTitleColor:[UIColor colorWithRed:77/255.0 green:174/255.0 blue:233/255.0 alpha:1] forState:UIControlStateNormal];
    [contentView addSubview:self.shootingGuideButton];
    [guideLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(contentView);
        make.centerY.equalTo(contentView).offset(-10);
    }];
    [self.shootingGuideButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(contentView);
        make.centerY.equalTo(contentView).offset(10);
    }];
    [self.shootingGuideButton addTarget:self action:@selector(shootingGuideButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)shootingGuideButtonClicked:(UIButton *)sender
{
    
}
- (void)backButtonClicked:(UIButton *)sender
{
    
}
- (void)nextButtonClicked:(UIButton *)sender
{
    
}



- (void)leftBarButtonItemClicked:(UIBarButtonItem *)sender
{
    
}

- (void)rightBarButtonItemClicked:(UIBarButtonItem *)sender
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
