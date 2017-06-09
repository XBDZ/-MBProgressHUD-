//
//  MBProgressHUD+XB_HUD.h
//  BaiSi
//
//  Created by 苹果 on 17/6/8.
//  Copyright © 2017年 Mr Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

typedef NS_ENUM(NSInteger,XB_ProgressMode)
{
    XB_ProgressModeOnlyText = 0,           //文字
    XB_ProgressModeLoading,              //加载菊花
    XB_ProgressHUDModeCustomView,          //加载图片
    XB_ProgressHUDModeDeterminate,         //扇形进度条
    XB_ProgressHUDModeDeterminateHorizontalBar  //长条进度条
};

@interface MBProgressHUD (XB_HUD)

/**
 *  菊花提示框(没有蒙板)
 *  @param view 要显示菊花的视图
 */
+(void)showView:(UIView *)view;
/**
 *  只带文字的提示框(没有蒙板)
 *  @param view 要显示菊花的视图
 *  @param text 显示的文字
 */
+(void)showText:(NSString *)text view:(UIView *)view;
/**
 *  菊花带文字的提示框(没有蒙板)
 *  @param view 要显示菊花的视图
 *  @param text 显示的文字
 */
+(void)showViewWithText:(NSString *)text view:(UIView *)view;

/**
 *  带进度条的提示框 *  @param view 要显示菊花的视图
 *  @param mode MBProgressHUD的类型
 *  @pa
ram text 显示的文字
 */
+ (MBProgressHUD *)showProgressToView:(UIView *)view ProgressModel:(XB_ProgressMode)model Text:(NSString *)text;

/**
 *  带图片的提示框
 *  @param view 要显示菊花的视图
 *  @param imageName 图片名称
 *  @param title 显示的文字
 */
+(void)showImage:(NSString *)title imageName:(NSString *)imageName view:(UIView *)view;

/**
 *  @param msg 可以是文字 可以为空
 *  @param view 要显示菊花的视图
 *  @param myMode MBProgressHUD的类型
 *  @param time 多少秒后消失  如果一直存在 传0
 *  @param background   是否有蒙板  YES 有蒙板  NO 没有蒙板
 */
//+(void)show:(NSString *)msg inView:(UIView *)view afterDelay:(CGFloat)time backGround:(BOOL)background mode:(XB_ProgressMode)myMode imageName:(NSString *)imageName;


//隐藏
+(void)hidden;



@end
