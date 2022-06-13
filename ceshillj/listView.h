//
//  listView.h
//  ceshillj
//
//  Created by csea on 2022/6/10.
//

#import <UIKit/UIKit.h>
#import "HeaderView.h"
#import "listView2.h"
@interface listView : UIView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * listtableView;
@property (nonatomic,strong)HeaderView * tabheader;

@property (nonatomic,strong)listView2 * listView_2;



@end


