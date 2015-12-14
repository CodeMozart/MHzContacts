//
//  MHzLoginAniView.m
//  01 - 私人通讯录
//
//  Created by Minghe on 8/16/15.
//  Copyright (c) 2015 Learn iOS Hard Way. All rights reserved.
//

#import "MHzLoginAniView.h"

/**
 *  这个类用来描述登陆界面的动画
 */

@interface MHzLoginAniView()

@property (weak, nonatomic) IBOutlet UIImageView *leftArm;
@property (weak, nonatomic) IBOutlet UIImageView *rightArm;
@property (weak, nonatomic) IBOutlet UIImageView *leftHand;
@property (weak, nonatomic) IBOutlet UIImageView *rightHand;
@property (weak, nonatomic) IBOutlet UIView *containView;

/**
 *  左边手臂一开始就偏移的x值
 */
@property (assign, nonatomic) CGFloat offsetLX;
/**
 *  左边手臂一开始就偏移的x值
 */
@property (assign, nonatomic) CGFloat offsetLY;
/**
 *  左边手臂一开始就偏移的x值
 */
@property (assign, nonatomic) CGFloat offsetRX;
/**
 *  左边手臂一开始就偏移的x值
 */
@property (assign, nonatomic) CGFloat offsetRY;

@end

/***********************************************************************************************************/



@implementation MHzLoginAniView

// 1.在初始化阶段，对动画进行一些操作

- (void)awakeFromNib
{
    // 设置偏移，让挡住眼睛的手臂看不到
    _offsetLX = -_leftArm.frame.origin.x ;
    _offsetLY = self.bounds.size.height -_leftArm.frame.origin.y;
    // 这个平移是相对于初始位置来说的，就是在_lef.frame.origin的基础上，平移相应的_offsetLX(Y)的值
    _leftArm.transform = CGAffineTransformMakeTranslation(_offsetLX,_offsetLY);
    
    _offsetRX = _containView.bounds.size.width - _rightArm.frame.origin.x - _rightHand.bounds.size.width;
    _offsetRY = _offsetLY;
    _rightArm.transform = CGAffineTransformMakeTranslation(_offsetRX,_offsetRY);
}

/***********************************************************************************************************/

- (void)startAni:(BOOL)isCoverEye
{
    if (isCoverEye) { // 捂上眼睛
        [UIView animateWithDuration:0.25 animations:^{
            
            _leftArm.transform = CGAffineTransformMakeTranslation(0, 0);
            CGAffineTransform lTransform = CGAffineTransformMakeTranslation(-_offsetLX, -_offsetLY + 5);
            lTransform = CGAffineTransformScale(lTransform, 0.1, 0.1);
            _leftHand.transform = lTransform;
            
            _rightArm.transform = CGAffineTransformMakeTranslation(0, 0);
            CGAffineTransform rTransform = CGAffineTransformMakeTranslation(-_offsetRX,-_offsetLY + 5);
            rTransform = CGAffineTransformScale(rTransform, 0.1, 0.1);
            _rightHand.transform = rTransform;

        }];
    }
    else{ // 睁开眼睛
       [ UIView animateWithDuration:0.25 animations:^{
            _leftArm.transform = CGAffineTransformMakeTranslation(_offsetLX,_offsetLY);
           CGAffineTransform lTransform = CGAffineTransformMakeTranslation(0,0);
           lTransform = CGAffineTransformScale(lTransform, 1, 1);
           _leftHand.transform = lTransform;
           
            _rightArm.transform = CGAffineTransformMakeTranslation(_offsetRX,_offsetRY);
           CGAffineTransform rTransform = CGAffineTransformMakeTranslation(0,0);
           rTransform = CGAffineTransformScale(rTransform, 1, 1);
           _rightHand.transform = rTransform;
       }];
    }
    
}




@end
