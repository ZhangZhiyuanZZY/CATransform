//
//  ViewController.m
//  转场动画
//
//  Created by 章芝源 on 16/1/11.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong)UIImageView *imageView;
@property(nonatomic, assign)int i;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //设置UI
    self.i = 1;
    [self setupUI];
}

- (void)setupUI
{
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"1"];
    imageView.frame = CGRectMake(100, 100, 200, 300);
    self.imageView = imageView;
    [self.view addSubview:imageView];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.i == 4) {
        self.i = 1;
    }

    ///这个是判断动画是否在执行,   但是判断的是UIView的动画
//   if ([self.imageView isAnimating])return;
    
    
    ///
    
    NSString *imgStr = [NSString stringWithFormat:@"%d", self.i];

    self.imageView.image = [UIImage imageNamed:imgStr];
    self.i ++;
    
    //进行转场动画
    CATransition *anim = [[CATransition alloc]init];
    //cameraIrisHollowOpen
//    anim.type = @"cameraIrisHollowOpen";
    //相机关闭
    //水滴
//    anim.type = @"rippleEffect";
    //cube立方翻滚
    anim.type = @"cube";
    //动画起始
    anim.subtype = @"fromLeft";
    anim.duration = 1.0;
    
    //设置动画进度,  从什么时候开始动画
    anim.startProgress = 0.5;
    [self.imageView.layer addAnimation:anim forKey:nil];
 
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
