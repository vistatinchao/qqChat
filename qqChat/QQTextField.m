//
//  QQTextField.m
//  qqChat
//
//  Created by mac on 2017/1/16.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import "QQTextField.h"

@implementation QQTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self setUpUI];
}

- (void)setUpUI
{
//    self.layer.masksToBounds = YES;
//    self.layer.cornerRadius = 22;
//    self.backgroundColor = Default_BackColor;
//    self.layer.borderColor = Default_SeparatorColor.CGColor;
//    self.layer.borderWidth = 1;
    self.font = [UIFont systemFontOfSize:16];
    //字体颜色
    self.textColor = [UIColor blackColor];
    //光标颜色
    self.tintColor= [UIColor blueColor];
    //占位符的颜色和大小
    [self setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self setValue:[UIFont boldSystemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];

}


//控制placeHolder的位置
-(CGRect)placeholderRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x+10, bounds.origin.y, bounds.size.width -10, bounds.size.height);//更好理解些
    return inset;
}

//控制显示文本的位置
-(CGRect)textRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x+10, bounds.origin.y, bounds.size.width -10, bounds.size.height);
    return inset;
}

//控制编辑文本的位置
-(CGRect)editingRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x +10, bounds.origin.y, bounds.size.width -10, bounds.size.height);
    return inset;
}

@end
