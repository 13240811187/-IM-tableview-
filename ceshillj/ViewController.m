//
//  ViewController.m
//  ceshillj
//
//  Created by csea on 2021/1/27.
//

#import "ViewController.h"
#import "TUILogin.h"
#import "GenerateTestUserSig.h"


#import "ConversationController.h"
#import "ChatViewController.h"
#import "HeaderView.h"
#define  SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define  SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#import "listView.h"

@interface ViewController ()



@end

@implementation ViewController


-(void)viewWillAppear:(BOOL)animated
{

     [super viewWillAppear:animated];
     [self.navigationController setNavigationBarHidden:YES animated:animated];
    
}


-(void)viewWillDisappear:(BOOL)animated
{
    
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
  
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
   
   
    
      if (@available(iOS 11.0, *))    {
          [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    

    
    // tableview  headerview覆盖 底部的tableview 让底部的tableview 相应事件
    listView  * list = [[listView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    [self.view addSubview:list];
    
    
    
//    UIButton * log = [[UIButton alloc] initWithFrame:CGRectMake(100, 80, 80, 44)];
//    log.backgroundColor = [UIColor redColor];
//    [log setTitle:@"登录" forState:UIControlStateNormal];
//    [log setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [log addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:log];

//
//
//    UIButton * ceshi = [[UIButton alloc] initWithFrame:CGRectMake(100, 130, 80, 44)];
//    ceshi.backgroundColor = [UIColor redColor];
//    [ceshi setTitle:@"列表" forState:UIControlStateNormal];
//    [ceshi setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [ceshi addTarget:self action:@selector(liebiao) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:ceshi];
//
//
//    UIButton * ceshi_login = [[UIButton alloc] initWithFrame:CGRectMake(100, 180, 80, 44)];
//    ceshi_login.backgroundColor = [UIColor redColor];
//    [ceshi_login setTitle:@"聊天" forState:UIControlStateNormal];
//    [ceshi_login setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [ceshi_login addTarget:self action:@selector(liaotian) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:ceshi_login];

    

    
//    NSString * annual_buttom_note= @"";
//
//    NSString *buttomstr = [NSString stringWithFormat:@"%@",annual_buttom_note.length > 0 ? annual_buttom_note:@""];
//
//    NSLog(@"buttomstr======%@",buttomstr);
//
//    NSString * annual_buttom= @"";
//
//    NSString *title = [NSString stringWithFormat:@"%@ %@",annual_buttom,annual_buttom_note];
//
//        NSRange priceRange = [title rangeOfString:buttomstr];
//
//     if (priceRange.location != NSNotFound) {
//
//        NSMutableAttributedString *mAttribleString = [[NSMutableAttributedString alloc] initWithString:title];
//        [mAttribleString addAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:18], NSForegroundColorAttributeName: [UIColor redColor]} range:NSMakeRange(0, priceRange.location)];
//        [mAttribleString addAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:13], NSForegroundColorAttributeName: [UIColor yellowColor]} range:priceRange];
//        [ceshi setAttributedTitle:mAttribleString.copy forState:UIControlStateNormal];
//
//    }
//
  
}



- (void)login{
    
    
    NSString *userSig = [GenerateTestUserSig genTestUserSig:@"1"];
    
    [TUILogin login:@"1" userSig:userSig succ:^{
            NSLog(@"-----> 登录成功");
        } fail:^(int code, NSString *msg) {
            NSLog(@"-----> 登录失败");
        }];
    
}


- (void)liebiao{
    ConversationController * ceshi = [[ConversationController alloc] init];
    [self.navigationController pushViewController:ceshi animated:YES];
    
}


- (void)liaotian{
   
    ChatViewController * ceshi = [[ChatViewController alloc] init];
    [self.navigationController pushViewController:ceshi animated:YES];
    
}





//编程题 3个线程顺序打印 0-100
- (void)print0_100 {
    
    __block int i = 0;
    dispatch_queue_t queueA = dispatch_queue_create("queue a", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queueB = dispatch_queue_create("queue b", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queueC = dispatch_queue_create("queue c", DISPATCH_QUEUE_CONCURRENT);

    NSCondition *condition = [[NSCondition alloc] init];
    
    dispatch_async(queueA, ^{
        while (1) {
            [condition lock];
            while (i%3 != 0) {
                [condition wait];
            }
            if (i > 100) {
                [condition unlock];
                return;
            }
            NSLog(@"A ==== i = %d",i);
            i++;
            [condition broadcast];
            [condition unlock];
        }
    });
    
    dispatch_async(queueB, ^{
        while (1) {
            [condition lock];
            while (i%3 != 1) {
                [condition wait];
            }
            if (i > 100) {
                [condition unlock];
                return;
            }
            NSLog(@"B ==== i = %d",i);
            i++;
            [condition broadcast];
            [condition unlock];
        }
    });

    dispatch_async(queueC, ^{
        while (1) {
            [condition lock];
            while (i%3 != 2) {
                [condition wait];
            }
            if (i > 100) {
                [condition unlock];
                return;
            }
            NSLog(@"C ==== i = %d",i);
            i++;
            [condition broadcast];
            [condition unlock];
        }
    });

}


@end
