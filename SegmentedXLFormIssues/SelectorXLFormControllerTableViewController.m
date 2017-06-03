//
//  SelectorXLFormControllerTableViewController.m
//  SegmentedXLFormIssues
//
//  Created by ycl on 2017/6/1.
//  Copyright © 2017年 ycl. All rights reserved.
//

#import "SelectorXLFormControllerTableViewController.h"

@interface SelectorXLFormControllerTableViewController ()

@end

NSString *const ksydk = @"sydk"; //贷款类型
NSString *const kdkje = @"dkje"; //贷款金额
NSString *const kdkqx = @"dkqx"; //贷款期限
NSString *const kdkllv = @"dklv"; //贷款利率
NSString *const khkfs = @"hkfs"; //还款方式

NSString *const klxze = @"lxze"; //利息总额
NSString *const khkze = @"hkze"; //还款总额
NSString *const kmyhk = @"myhk"; //每月还款

NSString *const kjsbutton = @"jsbutton"; //计算button

@implementation SelectorXLFormControllerTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initializeForm];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initializeForm];
    }
    return self;
}

- (void)initializeForm
{
    
    XLFormDescriptor * form;
    XLFormSectionDescriptor * section;
    XLFormRowDescriptor *row;
    
    form = [XLFormDescriptor formDescriptorWithTitle:@"贷款计算器"];
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    
    
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ksydk rowType:XLFormRowDescriptorTypeSelectorAlertView title:@"选着类型:"];
    row.required = YES;
    row.selectorOptions = @[
                            [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"类型1"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"类型2"],
                            ];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"类型1"];
    
    [section addFormRow:row];
    
    
    
    
    self.form = form;
}



@end
