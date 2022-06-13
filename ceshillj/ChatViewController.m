//
//  ChatViewController.m
//  ceshillj
//
//  Created by csea on 2022/3/4.
//

#import "ChatViewController.h"



@interface ChatViewController ()<TUIChatControllerListener>

@end

@implementation ChatViewController

//-(void)viewWillAppear:(BOOL)animated
//{
//     [super viewWillAppear:animated];
//     [self.navigationController setNavigationBarHidden:YES animated:animated];
//}
//
//
//-(void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO  animated:animated];
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 创建会话信息
     TUIChatConversationModel *data = [[TUIChatConversationModel alloc] init];
     data.userID = @"606716";
     // 创建 TUIC2CChatViewController
     TUIC2CChatViewController *conv = [[TUIC2CChatViewController alloc] init];
     [conv setConversationData:data];
     // 把 TUIC2CChatViewController 添加到自己的 ViewController
     [self addChildViewController:conv];
     [self.view addSubview:conv.view];

    
    conv.delegate = self; //遵循代理
    
}

/**
 *  点击消息内容回调
 *
 *  @param controller 会话对象
 *  @param cell 所点击的消息单元
 */
- (void)chatController:(TUIBaseChatViewController *)controller onSelectMessageContent:(TUIMessageCell *)cell{
    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
