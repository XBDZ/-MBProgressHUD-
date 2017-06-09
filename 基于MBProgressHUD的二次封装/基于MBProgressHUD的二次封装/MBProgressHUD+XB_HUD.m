//
//  MBProgressHUD+XB_HUD.m
//  BaiSi
//
//  Created by 苹果 on 17/6/8.
//  Copyright © 2017年 Mr Liu. All rights reserved.
//

#import "MBProgressHUD+XB_HUD.h"
#include <objc/runtime.h>

@implementation MBProgressHUD (XB_HUD)

/**
 *  @param msg 可以是文字 可以为空
 *  @param view 要显示菊花的视图
 *  @param myMode MBProgressHUD的类型
 *  @param time 多少秒后消失  如果一直存在 传0
 *  @param background   是否有蒙板  YES 有蒙板  NO 没有蒙板
 */
+(void)show:(NSString *)msg inView:(UIView *)view afterDelay:(CGFloat)time backGround:(BOOL)background mode:(XB_ProgressMode)myMode imageName:(NSString *)imageName;
{
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:view animated:YES];

    hud.labelText = msg;

    // 是否有蒙板
    if (background == YES) hud.dimBackground = YES;
   
    // 提示框的颜色
    hud.color = [UIColor blackColor];
    // 内容距提示框的大小
    hud.margin = 10.0f;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    //消失的时间
    if (time != 0) {
        [hud hide:YES afterDelay:time];
    }
    
    if (imageName != nil) {
        if ([msg isEqualToString:@"error.png"] || [msg isEqualToString:@"success.png"]) {
            hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", imageName]]];
        }else{
            hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        }

    }

    switch ((NSInteger)myMode) {
        case XB_ProgressModeOnlyText:
            hud.mode = MBProgressHUDModeText;
            break;
            
        case XB_ProgressModeLoading:
            hud.mode = MBProgressHUDModeIndeterminate;
            break;
            
        case XB_ProgressHUDModeCustomView:
            hud.mode = MBProgressHUDModeCustomView;
            break;
            
            
        default:
            break;
    }
};
#pragma mark - 菊花提示框
+(void)showView:(UIView *)view
{
    [self show:@"" inView:view afterDelay:0 backGround:YES mode:XB_ProgressModeLoading imageName:nil];
}
#pragma mark - 只显示文字的提示框
+(void)showText:(NSString *)text view:(UIView *)view
{
    [self show:text inView:view afterDelay:0.9f backGround:NO mode:XB_ProgressModeOnlyText imageName:nil];
}
#pragma mark - 菊花加文字的提示框
+(void)showViewWithText:(NSString *)text view:(UIView *)view
{
    [self show:text inView:view afterDelay:0.9f backGround:NO mode:XB_ProgressModeLoading imageName:nil];
}
#pragma mark - 带进度条的提示框
+ (MBProgressHUD *)showProgressToView:(UIView *)view ProgressModel:(XB_ProgressMode)model Text:(NSString *)text{
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    switch ((NSInteger)model) {
        case XB_ProgressHUDModeDeterminate:
            hud.mode = MBProgressHUDModeDeterminate;
            break;
   
        case XB_ProgressHUDModeDeterminateHorizontalBar:
            hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
            break;

        default:
            break;
    }
    hud.removeFromSuperViewOnHide = YES;
    hud.labelText = text;
    return hud;
}
#pragma mark - 带图片的提示框
+(void)showImage:(NSString *)title imageName:(NSString *)imageName view:(UIView *)view
{
    [self show:title inView:view afterDelay:0 backGround:NO mode:XB_ProgressHUDModeCustomView imageName:imageName];
}

+(void)hideHUDForView:(UIView *)view
{
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;
    [self hideHUDForView:view animated:YES];
}
#pragma mark - 隐藏提示框
+(void)hidden
{
    [self hideHUDForView:nil];
}










@end
