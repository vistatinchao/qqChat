//
//  QQViewController.m
//  qqChat
//
//  Created by mac on 2017/1/11.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
// QQViewController

#import "QQViewController.h"
#import "QQMessageFrame.h"
#import "QQMessage.h"
#import "QQMessageCell.h"
#import "QQKeyboardToolbar.h"
@interface QQViewController ()<UITableViewDelegate,UITableViewDataSource>

/**message数据源*/
@property (nonatomic,strong)NSMutableArray<QQMessageFrame *> *messages;
/**tableView*/
@property (nonatomic,weak)UITableView *tableView;
/**keyboardToolbar*/
@property (nonatomic,weak)QQKeyboardToolbar *keyboardToolbar;
@end

@implementation QQViewController

#pragma mark 系统方法
/**
 view加载完毕
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"2B";
    [self initTableView];
    [self initKeyboardToolbar];
    // 接收通知
    [self addNotification];
    
}

/**
 view显示完毕
 */
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.messages.count-1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition: UITableViewScrollPositionBottom animated:YES];

}

/**
 移除监听
 */
- (void)dealloc{
    [QQNotiCenter removeObserver:self];
}



#pragma mark 键盘改变通知
- (void)addNotification{

    [QQNotiCenter addObserver:self selector:@selector(keyboardChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

/**
 键盘改变通知
 */
- (void)keyboardChangeFrame:(nonnull NSNotification *)noti{
    // 动画时间
    CGFloat duration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    // 键盘最终的Frame
    CGRect keyboardFrame = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat offsetKeyboardFrameY = keyboardFrame.origin.y-self.view.height;

    [UIView animateWithDuration:duration animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, offsetKeyboardFrameY);
    }];

}
#pragma mark 初始化子控件

/**
 初始化tableview
 */
- (void)initTableView{
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.backgroundColor = QQGlobleColor;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.contentInset = UIEdgeInsetsMake(QQNavBarHeight, 0, 44, 0);
    tableView.scrollIndicatorInsets = tableView.contentInset;
    tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    // 不允许选中
    tableView.allowsSelection = NO;
    // 拽掉tableview的时候退键盘
    tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [tableView registerClass:[QQMessageCell class] forCellReuseIdentifier:QQMessageCellID];
    self.tableView = tableView;

}

/**
 初始化KeyboardToolbar
 */
-(void)initKeyboardToolbar{
    QQKeyboardToolbar *toolbar = [QQKeyboardToolbar keyboardToolbar];
    [self.view addSubview:toolbar];
    toolbar.width = self.view.width;
    toolbar.height = QQKeyboardToolbarHeight;
    toolbar.y = self.view.height-toolbar.height;
    self.keyboardToolbar = toolbar;
}


#pragma mark tableview代理方法&数据源方法--
/**
 返回row
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.messages.count;
}

/**
 返回cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QQMessageCell *cell = [QQMessageCell cellWithTableView:tableView indexPath:indexPath];
    cell.messageFrame = self.messages[indexPath.row];
    return cell;
}

/**
 返回row的cellHeight
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.messages[indexPath.row].cellHeight;
}

#pragma mark lazy-数据源

- (NSMutableArray<QQMessageFrame *> *)messages{
    if (!_messages) {
        NSMutableArray *messageArr = [NSMutableArray array];
        NSString *dataPath = [[NSBundle mainBundle]pathForResource:@"messages.plist" ofType:nil];
        NSArray *messages = [NSArray arrayWithContentsOfFile:dataPath];
        for (NSDictionary *messageDict in messages) {
            QQMessage *message = [QQMessage messageWithDictonary:messageDict];
            QQMessageFrame *messageFrame = [[QQMessageFrame alloc]init];


            // 判断上一个message模型的时间是否和当前时间相等
            QQMessageFrame *lastMessageFrame = messageArr.lastObject;
            
            if (![lastMessageFrame.message.time isEqualToString:message.time]) {// 不相等才显示时间
                message.showTime = YES;
            }else{ // 隐藏时间
                message.showTime = NO;
            }
            messageFrame.message = message;
             [messageArr addObject:messageFrame];

        }
        _messages = messageArr;
    }
    return _messages;
}

@end
