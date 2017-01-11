//
//  QQMessageCell.h
//  qqChat
//
//  Created by mac on 2017/1/11.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@class QQMessageFrame;
@interface QQMessageCell : UITableViewCell
/** messageFrame 模型展示数据*/
@property (nonatomic,strong,nullable)QQMessageFrame *messageFrame;

+ (instancetype)cellWithTableView:(nullable UITableView *)tableView indexPath:(nullable NSIndexPath *)indexPath;

@end
NS_ASSUME_NONNULL_END
