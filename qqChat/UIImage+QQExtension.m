//
//  UIImage+QQExtension.m
//  qqChat
//
//  Created by mac on 2017/1/12.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import "UIImage+QQExtension.h"

@implementation UIImage (QQExtension)
-(instancetype)resizeImage
{
    //缩放图片
    return [self resizableImageWithCapInsets:UIEdgeInsetsMake(self.size.height*0.5, self.size.width*0.5, self.size.height*0.5,self.size.width*0.5) resizingMode:UIImageResizingModeStretch];
}
@end
