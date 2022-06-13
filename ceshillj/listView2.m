//
//  listView2.m
//  ceshillj
//
//  Created by csea on 2022/6/10.
//

#import "listView2.h"
#define  SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define  SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@implementation listView2


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
       
    
        [self addSubview:self.listtableView];
        
    }
    return self;
}




-(UITableView *)listtableView
{
    
    if (!_listtableView) {
        _listtableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300) style:UITableViewStyleGrouped];
        _listtableView.dataSource = self;
        _listtableView.delegate = self;
        _listtableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _listtableView.backgroundColor = [UIColor clearColor];
        _listtableView.showsVerticalScrollIndicator = NO;
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
            DetTop_cell.backgroundColor = [UIColor redColor];
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
    view.backgroundColor = [UIColor yellowColor];
    return view;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 20;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
    view.backgroundColor = [UIColor yellowColor];
    return view;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     [tableView deselectRowAtIndexPath:indexPath animated:NO];

    NSLog(@"tableview_1");
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
