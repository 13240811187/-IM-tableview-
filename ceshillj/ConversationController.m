//
//  ConversationController.m
//  ceshillj
//
//  Created by csea on 2022/3/4.
//

#import "ConversationController.h"
#import "ChatViewController.h"
@interface ConversationController ()<TUIConversationListControllerListener,V2TIMConversationListener>

@end

@implementation ConversationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // 创建 TUIConversationListController   用腾讯的控制器直接出来列表
        TUIConversationListController *conv = [[TUIConversationListController alloc] init];
        conv.delegate = self;
        // 把 TUIConversationListController 添加到自己的 ViewController
        [self addChildViewController:conv];
        [self.view addSubview:conv.view];
    
    
    // 1. 设置会话监听 单独获取会话列表
    [[V2TIMManager sharedInstance] addConversationListener:self];
    
    [self onFriendInfoChanged];
    
    
}


//获取会话列表
- (void)onFriendInfoChanged
{
   
    [[V2TIMManager sharedInstance] getConversationList:0 count:100 succ:^(NSArray<V2TIMConversation *> *list, uint64_t nextSeq, BOOL isFinished) {
        
    
        for (V2TIMConversation * model in list) {
            
            NSLog(@"%@%@",model.showName,model.lastMessage.textElem.text);
        }
       
        
        
    } fail:^(int code, NSString *desc) {
        
    }];
    
            
}




- (void)conversationListController:(TUIConversationListController *)conversationController didSelectConversation:(TUIConversationCell *)conversation
{
    // 会话列表点击事件，通常是打开聊天界面
    
    ChatViewController * chat = [[ChatViewController alloc] init];
    [self.navigationController pushViewController:chat animated:YES];
    
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
