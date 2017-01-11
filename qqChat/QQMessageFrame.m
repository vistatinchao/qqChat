//
//  QQMessageFrame.m
//  qqChat
//
//  Created by mac on 2017/1/11.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import "QQMessageFrame.h"
#import "QQMessage.h"
@implementation QQMessageFrame

- (void)setMessage:(QQMessage *)message{
    _message = message;
    [self caculatePropertyFrameWithMessage:message];
}

- (void)caculatePropertyFrameWithMessage:(QQMessage *)message{

}
@end
