//
//  QQKeyboardToolbar.m
//  qqChat
//
//  Created by mac on 2017/1/12.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import "QQKeyboardToolbar.h"

@implementation QQKeyboardToolbar

+(instancetype)keyboardToolbar{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}


@end
