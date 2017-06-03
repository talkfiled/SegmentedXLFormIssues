//
//  CoreViewController.m
//  SegmentedXLFormIssues
//
//  Created by ycl on 2017/6/1.
//  Copyright © 2017年 ycl. All rights reserved.
//

#import "CoreViewController.h"
#import "UIScrollView+DZNSegmentedControl.h"
#import "SelectorXLFormControllerTableViewController.h"

@interface CoreViewController ()<DZNSegmentedControlDelegate>
@property(nonatomic,strong) NSMutableArray *viewsControlelrs;
@end

@implementation CoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _viewsControlelrs = [[NSMutableArray alloc] init];
    
    NSArray *items = @[@"控制器1", @"控制器2"];
    
    _segcontroll.items = items;
//    _segcontroll.tintColor = [ UIColor hx_colorWithHexRGBAString:@"#1c7ddfff"];
    
    _segcontroll.delegate = self;
    _segcontroll.showsCount = NO;
    self.segcontroll.autoAdjustSelectionIndicatorWidth = YES;
    
    self.svcontent.segmentedControl = _segcontroll;
    self.svcontent.scrollDirection = DZNScrollDirectionHorizontal;
    self.svcontent.scrollOnSegmentChange = YES;

}

-(void) viewDidDisappear:(BOOL)animated{
    self.svcontent.segmentedControl = nil;
}

-(void) viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    __block CGFloat offsetValue = 0.0;
    __block CGSize contentSize = CGSizeZero;
    
    [self.segcontroll.items enumerateObjectsUsingBlock:^(NSString *name,
                                                         NSUInteger idx, BOOL *stop){
        CGRect frame = self.svcontent.bounds;
        frame.origin.x = offsetValue;
        
        [self addViewController:idx withFrame:frame];
        offsetValue += CGRectGetWidth(frame);
    }];
    
    contentSize = CGSizeMake(offsetValue, self.svcontent.frame.size.height);
    self.svcontent.contentSize = contentSize;
}

-(void) addViewController:(NSInteger) idx withFrame:(CGRect) frame{
    UIViewController *controller = [[SelectorXLFormControllerTableViewController alloc ] init];
    
    controller.view.frame = frame;
    controller.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [_viewsControlelrs addObject:controller];
    [self.svcontent addSubview:controller.view];
}

#pragma mark - DZNSegmentedControlDelegate Methods

- (UIBarPosition)positionForBar:(id <UIBarPositioning>)view
{
    return UIBarPositionAny;
}

- (UIBarPosition)positionForSelectionIndicator:(id<UIBarPositioning>)bar
{
    return UIBarPositionAny;
}


@end
