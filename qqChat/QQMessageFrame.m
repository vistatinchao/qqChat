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

    /**时间*/
    if (message.isShowTime) {// 显示时间
        CGFloat timeX = 0;
        CGFloat timeY = 0;
        CGFloat timeW = QQScreenW;
        CGFloat timeH = 40;
        _timeFrame = CGRectMake(timeX, timeY, timeW, timeH);
    }

    /**头像*/
    CGFloat imageX= QQMessageCellMargin;
    if (message.type==QQMessageTypeMe) {
        imageX = QQScreenW-QQMessageCellProfileImageWH-QQMessageCellMargin;
    }
    CGFloat imageY = CGRectGetMaxY(_timeFrame);
    CGSize imageSize = CGSizeMake(QQMessageCellProfileImageWH, QQMessageCellProfileImageWH);
    _imageFrame = CGRectMake(imageX, imageY, imageSize.width, imageSize.height);

    /**正文*/
    CGFloat textX = CGRectGetMaxX(_imageFrame)+QQMessageCellMargin;
    CGFloat textY = imageY;
    CGFloat textMaxW = 200;
    CGSize textSize = [message.text stringWithFontSize:[UIFont systemFontOfSize:QQMessageCellTextFontSize] andMaxSize:CGSizeMake(textMaxW, MAXFLOAT)];
    if (message.type==QQMessageTypeMe) {
        textX = imageX-textSize.width-2*QQMessageCellBtnInsetMargin;
    }
    _textFrame = CGRectMake(textX, textY, textSize.width+2*QQMessageCellBtnInsetMargin, textSize.height+2*QQMessageCellBtnInsetMargin);

    /**cellHeight*/
    CGFloat imageMaxY = CGRectGetMaxY(_imageFrame);
    CGFloat textMaxY = CGRectGetMaxY(_textFrame);
    _cellHeight = MAX(imageMaxY, textMaxY)+QQMessageCellMargin;
}
@end
