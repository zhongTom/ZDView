//
//  ZDView.m
//  test
//
//  Created by 蛋蛋语音 on 2020/10/21.
//

#import "ZDView.h"

@implementation ZDView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // 重点开始！！UITouch 获取在 barrageView 坐标系下的坐标
    CGPoint touchPoint = [[touches anyObject] locationInView:self];
    // 判断触摸点是否在 redView 的呈现树的框框之中
    if ([self.layer.presentationLayer hitTest:touchPoint]) {
        NSLog(@"zz");
        return;
    } else {

    }
}

@end
