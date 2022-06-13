//
//  listView.m
//  ceshillj
//
//  Created by csea on 2022/6/10.
//

#import "listView.h"

#define  SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define  SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@implementation listView



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {}



- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    
    UIView *hitView = [super hitTest:point withEvent:event];
    if([hitView isKindOfClass:[HeaderView class]]){
        
         self.listtableView.userInteractionEnabled = NO;
          return nil;
      }
    
    
     self.listtableView.userInteractionEnabled = YES;
     return hitView;

}



- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
       
        
          if (@available(iOS 11.0, *))    {
             self.listtableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            } else {
                
            }
    
        
        
        self.listView_2 = [[listView2 alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];

        [self addSubview:self.listView_2];
        
        [self addSubview:self.listtableView];
        
    }
    return self;
}



- (void)login{
    
    
    NSLog(@"-----> 登录成功");
    
}


-(UITableView *)listtableView
{
    
    if (!_listtableView) {
        _listtableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _listtableView.dataSource = self;
        _listtableView.delegate = self;
        _listtableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _listtableView.backgroundColor = [UIColor clearColor];
        _listtableView.showsVerticalScrollIndicator = NO;
        self.tabheader = [[HeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
        self.tabheader.backgroundColor = [UIColor clearColor];
        _listtableView.tableHeaderView = self.tabheader;
        _listtableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CGFLOAT_MIN)];
        [self disableEstimatedRowHeight];
        
    }
    
    return _listtableView;
    
}




-(void)disableEstimatedRowHeight
{
    
    if (@available(iOS 15.0, *)) {
        self.listtableView.sectionHeaderTopPadding = 0;
    }
    
    self.listtableView.estimatedRowHeight = 0;
    self.listtableView.estimatedSectionFooterHeight = 0;
    self.listtableView.estimatedSectionHeaderHeight = 0;
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
   return 20;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString * DetTop = @"LLJTheCoach_CourseDetTopTableViewCellid";
    UITableViewCell * DetTop_cell = [tableView dequeueReusableCellWithIdentifier:DetTop];

        if (!DetTop_cell) {
            DetTop_cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DetTop];
            DetTop_cell.selectionStyle = UITableViewCellSelectionStyleNone;
            DetTop_cell.backgroundColor = [UIColor blueColor];
        }
    

        return DetTop_cell;
    
}




-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    return 80;
    
}





- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
 
    return 30;

}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    view.backgroundColor = [UIColor blackColor];
    return view;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 20;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
    view.backgroundColor = [UIColor blackColor];
    return view;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     [tableView deselectRowAtIndexPath:indexPath animated:NO];

    NSLog(@"tableview_2");
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
