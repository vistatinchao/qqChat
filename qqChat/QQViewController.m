//
//  QQViewController.m
//  qqChat
//
//  Created by mac on 2017/1/11.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import "QQViewController.h"
#import "QQMessageFrame.h"
#import "QQMessage.h"
#import "QQMessageCell.h"
@interface QQViewController ()
@property (nonatomic,strong)NSMutableArray<QQMessageFrame *> *messages;
@property (nonatomic,weak)UITableView *tableView;
@end

@implementation QQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self initTableView];
    
}
#warning todo
- (void)initTableView{

}

- (NSMutableArray<QQMessageFrame *> *)messages{
    if (!_messages) {
        NSMutableArray *messageArr = [NSMutableArray array];
        NSString *dataPath = [[NSBundle mainBundle]pathForResource:@"messages.plist" ofType:nil];
        NSArray *messages = [NSArray arrayWithContentsOfFile:dataPath];
        for (NSDictionary *messageDict in messages) {
            QQMessage *message = [QQMessage messageWithDictonary:messageDict];
            QQMessageFrame *messageFrame = [[QQMessageFrame alloc]init];
            messageFrame.message = message;
            [messageArr addObject:messageFrame];
        }
        _messages = messageArr;
    }
    return _messages;
}

@end
