//
//  QQMessage.h
//  qqChat
//
//  Created by mac on 2017/1/11.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    QQMessageTypeMe,
    QQMessageTypeOther
} QQMessageType;

@interface QQMessage : NSObject
/**Message文本*/
@property (nonatomic,copy,nullable) NSString *text;
/**Message发送时间*/
@property (nonatomic,copy,nullable) NSString *time;
/**Message谁发的*/
@property (nonatomic,assign)QQMessageType type;

/**
 字典转模型
 @param messageDict 传过来的字典
 @return 当前对象
 */
+(instancetype)messageWithDictonary:(NSDictionary *)messageDict;
@end
NS_ASSUME_NONNULL_END
