/******************************************************************************
 *
 *  本文件声明了两个类，TUIMenuCellData 和 TUIMenuCell 用于实现表情菜单视图中的单个表情单元。
 *  表情菜单视图，即在表情视图最下方的亮白色视图，负责显示各个表情分组及其缩略图，并提供“发送”按钮。
 *  本文件包含的两个类的功能简述：
 *  TUIMenuCellData：存储表情菜单缩略图的本地存储路径，同时包含其选择标志位（isSelected）。
 *  TUIMenuCell：存储表情菜单的图像，并根据 TUIMenuCellData 初始化 Cell。
 *
 ******************************************************************************/
#import <UIKit/UIKit.h>
#import "TUIMenuCellData.h"

/////////////////////////////////////////////////////////////////////////////////
//
//                             TUIMenuCell
//
/////////////////////////////////////////////////////////////////////////////////

/**
 * 【模块名称】TUIMenuCell
 * 【功能说明】存放表情菜单的图像，并在表情菜单视图中作为显示单元，同时也是响应用户交互的基本单元。
 */
@interface TUIMenuCell : UICollectionViewCell
/**
 *  菜单图像视图
 */
@property (nonatomic, strong) UIImageView *menu;

/**
 *  设置数据，包含设置表情图标、设置 frame 大小、根据 isSelected 设置背景颜色等。
 *
 *  @param data 需要设置的数据（TUIMenuCellData）
 */
- (void)setData:(TUIMenuCellData *)data;
@end
