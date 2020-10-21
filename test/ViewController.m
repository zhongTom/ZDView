//
//  ViewController.m
//  test
//
//  Created by 蛋蛋语音 on 2020/10/20.
//

#import "ViewController.h"
#import "ZDView.h"
@interface ViewController ()
@property (nonatomic, strong) ZDView *colorView;
@property (nonatomic, strong) UIView *tapView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.colorView = [ZDView new];
    self.colorView.frame = CGRectMake(375, 200, 200, 60);
    self.colorView.backgroundColor = [UIColor redColor];
    self.colorView.clipsToBounds = NO;
    self.colorView.layer.masksToBounds = NO;
    self.colorView.userInteractionEnabled = NO;
    [self.view addSubview:self.colorView];
    UIView *tapView = [UIView new];
    tapView.frame = CGRectMake(30, 10, 150, 40);
    [tapView setBackgroundColor:[UIColor grayColor]];
    self.tapView = tapView;
    [self.colorView addSubview:tapView];

    self.colorView.transform = CGAffineTransformIdentity;
    [UIView animateKeyframesWithDuration:15 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear|UIViewKeyframeAnimationOptionAllowUserInteraction animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1.0/5 animations:^{
            CGRect frame = self.colorView.frame;
            frame.origin.x = 275;
            self.colorView.frame = frame;
        }];
        [UIView addKeyframeWithRelativeStartTime:1.0/5 relativeDuration:1.5/3 animations:^{
            CGRect frame = self.colorView.frame;
            frame.origin.x = 0;
            self.colorView.frame = frame;
        }];
        [UIView addKeyframeWithRelativeStartTime:1.0/5+1.5/3 relativeDuration:0.3 animations:^{
            CGRect frame = self.colorView.frame;
            frame.origin.x = -375;
            self.colorView.frame = frame;
        }];

    } completion:^(BOOL finished) {

    }];
}
- (void)test {
    NSLog(@"click");
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // 获取到点击的位置
       UITouch * touch = touches.anyObject;
       CGPoint point = [touch locationInView:self.view];
       
       // 判断redView.layer.presentationLayer是否包含这个点
       // 方式1:CGRectContainsPoint
    
    CGRect frame2 = self.colorView.layer.presentationLayer.frame;
    CGRect frame1 = self.tapView.layer.presentationLayer.frame;
    frame1.origin.x += frame2.origin.x;
    frame1.origin.y += frame2.origin.y;
       if ( CGRectContainsPoint(frame1, point) ) {
           NSLog(@"contain");
       }
       // 方式2:hitT
}
@end

