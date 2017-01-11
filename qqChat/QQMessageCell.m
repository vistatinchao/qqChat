//
//  QQMessageCell.m
//  qqChat
//
//  Created by mac on 2017/1/11.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import "QQMessageCell.h"
#import "QQMessageFrame.h"
@interface QQMessageCell()

@end
@implementation QQMessageCell

#pragma mark QQMessageCell 系统方法

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 添加子控件
        [self setSubView];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setSubView{

}

#pragma mark QQMessageCell set方法
- (void)setMessageFrame:(QQMessageFrame *)messageFrame{
    _messageFrame = messageFrame;
    QQMessage *message = messageFrame.message;

    // 设置子控件Frame
    [self setSubViewFrameWithMessageFrame:messageFrame];

    // 设置子控件数据
    [self setSubViewDataWithMessage:message];
}


#pragma mark QQMessageCell--PrivateMethod
- (void)setSubViewFrameWithMessageFrame:(QQMessageFrame *)messageFrame{


    #warning 设置数据
}

- (void)setSubViewDataWithMessage:(QQMessage *)message{
      #warning 设置数据
}
@end
