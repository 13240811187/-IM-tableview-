//
//  HeaderView.m
//  ceshillj
//
//  Created by csea on 2022/6/10.
//

#import "HeaderView.h"

@implementation HeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {}
//
//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {}
//
//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {}
//
//- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {}
//


//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//    // 1.判断当前控件能否接收事件
//    if (self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01) {return nil;}
//
//    // 2. 判断点在不在当前控件
//    if ([self pointInside:point withEvent:event] == NO) {return nil;}
//
//    // 3.从后往前遍历自己的子控件
//    NSInteger subViewCoutn = self.subviews.count;
//
//    for (NSInteger i = subViewCoutn - 1; i >= 0; i--) {
//        // 取subView
//        UIView *childView = self.subviews[i];
//        // 把当前控件上的坐标系转换成子控件上的坐标系
//        CGPoint childP = [self convertPoint:point toView:childView];
//        // 寻找到最合适的view
//        UIView *fitView = [childView hitTest:childP withEvent:event];
//
//        if (fitView) {
//            return fitView;
//        }
//    }
//
//    NSLog(@"点击了：%@",NSStringFromClass([self class]));
//
//    // 循环结束,表示没有比自己更合适的view
//    return self;
//
//}



//- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    UIView *hitView = [super hitTest:point withEvent:event];
//    if(hitView == self){
//        return nil;
//    }
//    return hitView;
//}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
