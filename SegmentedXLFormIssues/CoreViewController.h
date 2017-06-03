//
//  CoreViewController.h
//  SegmentedXLFormIssues
//
//  Created by ycl on 2017/6/1.
//  Copyright © 2017年 ycl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZNSegmentedControl.h"

@interface CoreViewController : UIViewController
@property (weak, nonatomic) IBOutlet DZNSegmentedControl *segcontroll;
@property (weak, nonatomic) IBOutlet UIScrollView *svcontent;
@end
