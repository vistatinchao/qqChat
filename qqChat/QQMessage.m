//
//  QQMessage.m
//  qqChat
//
//  Created by mac on 2017/1/11.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import "QQMessage.h"

@implementation QQMessage
+(instancetype)messageWithDictonary:(NSDictionary *)messageDict{
    QQMessage *message = [[self alloc]init];
    message.text = messageDict[@"text"];
    message.time = messageDict[@"time"];
    message.type = messageDict[@"type"]
}
@end
