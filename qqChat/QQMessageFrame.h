//
//  QQMessageFrame.h
//  qqChat
//
//  Created by mac on 2017/1/11.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@class QQMessage;
@interface QQMessageFrame : NSObject
/**Message模型*/
@property (nonatomic,strong,nullable)QQMessage *message;
/**时间frame*/
@property (nonatomic,assign,readonly)CGRect timeFrame;
/**文本Frame*/
@property (nonatomic,assign,readonly)CGRect textFrame;
/**头像Frame*/
@property (nonatomic,assign,readonly)CGRect imageFrame;
/**cell高度*/
@property (nonatomic,assign,readonly)CGFloat cellHeight;
@end
NS_ASSUME_NONNULL_END
