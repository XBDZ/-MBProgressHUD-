//
//  ViewController.m
//  基于MBProgressHUD的二次封装
//
//  Created by 苹果 on 17/6/9.
//  Copyright © 2017年 Mr Liu. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD+XB_HUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [MBProgressHUD showImage:@"" imageName:@"talk_gift" view:self.view];
    //    [MBProgressHUD showView:self.view];
    //    [MBProgressHUD showText:@"加载中" view:self.view];
    //    [MBProgressHUD showViewWithText:@"231" view:self.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
