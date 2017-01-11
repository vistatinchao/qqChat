//
//  NSString+QQExtension.m
//  qqChat
//
//  Created by mac on 2017/1/11.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import "NSString+QQExtension.h"

@implementation NSString (QQExtension)
#pragma mark  根据文字自适应尺寸
- (CGSize)stringWithFontSize:(nullable UIFont *)font andMaxSize:( CGSize)size{

    NSMutableDictionary *attributeDict = [NSMutableDictionary dictionary];
    attributeDict[NSFontAttributeName] = font;
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributeDict context:nil].size;
}
@end
