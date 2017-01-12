//
//  QQMessageCell.m
//  qqChat
//
//  Created by mac on 2017/1/11.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import "QQMessageCell.h"
#import "QQMessageFrame.h"
#import "QQMessage.h"
@interface QQMessageCell()

/**时间*/
@property (nonatomic,weak)UILabel *timeLabel;
/**正文*/
@property (nonatomic,weak)UIButton *textBtn;
/**头像*/
@property (nonatomic,weak)UIImageView *profileImageView;

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
#pragma mark 初始化cell
+(instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath{
    QQMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:QQMessageCellID];
    if (cell==nil) {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:QQMessageCellID];
    }
    return cell;
}

- (void)setSubView{

    /**时间*/
    UILabel *timeLabel = [[UILabel alloc]init];
    [self.contentView addSubview:timeLabel];
    timeLabel.textAlignment = NSTextAlignmentCenter;
    timeLabel.font = [UIFont systemFontOfSize:QQMessageCellTimeFontSize];
    self.timeLabel = timeLabel;

    /**正文*/
    UIButton *textBtn = [[UIButton alloc]init];
    [self.contentView addSubview:textBtn];
    textBtn.titleLabel.numberOfLines = 0;
    textBtn.titleLabel.font = [UIFont systemFontOfSize:QQMessageCellTextFontSize];
    [textBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [textBtn setTitleEdgeInsets:UIEdgeInsetsMake(QQMessageCellBtnInsetMargin, QQMessageCellBtnInsetMargin, QQMessageCellBtnInsetMargin, QQMessageCellBtnInsetMargin)];
    self.textBtn = textBtn;

    /**头像*/
    UIImageView *profileImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:profileImageView];
    //设置圆形
    profileImageView.layer.cornerRadius = QQMessageCellProfileImageWH*0.5;
    profileImageView.layer.masksToBounds = YES;
    self.profileImageView = profileImageView;
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

    /**时间frame*/
    self.timeLabel.frame = messageFrame.timeFrame;
    /**正文frame*/
    self.textBtn.frame = messageFrame.textFrame;
    /**头像frame*/
    self.profileImageView.frame = messageFrame.imageFrame;

}

- (void)setSubViewDataWithMessage:(QQMessage *)message{
     /**时间*/
    self.timeLabel.text = message.time;
     /**正文*/
    [self.textBtn setTitle:message.text forState:UIControlStateNormal];
    UIImage *backgroundImage;
    UIImage *highlightenBackgroundImage;
    if (message.type==QQMessageTypeMe) {
        backgroundImage = [[UIImage imageNamed:@"chat_send_nor"]resizeImage];
        highlightenBackgroundImage = [[UIImage imageNamed:@"chat_send_press_pic"] resizeImage];
    }else{
        backgroundImage = [[UIImage imageNamed:@"chat_recive_nor"] resizeImage];
        highlightenBackgroundImage = [[UIImage imageNamed:@"chat_recive_press_pic"] resizeImage];
    }
    [self.textBtn setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    [self.textBtn setBackgroundImage:highlightenBackgroundImage forState:UIControlStateHighlighted];
     /**头像*/
    NSString *image;
    image = (message.type==QQMessageTypeMe)?@"me":@"other";
    self.profileImageView.image = [UIImage imageNamed:image];
}
@end
