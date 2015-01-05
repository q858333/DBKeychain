//
//  ViewController.m
//  DBKeychain
//
//  Created by dengbin on 15/1/5.
//  Copyright (c) 2015年 IUAIJIA. All rights reserved.
//

#import "ViewController.h"
#import "DBKeychainTool.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"%@",[DBKeychainTool getValueForKey:@"test"]);
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)buttonClick:(id)sender
{
    [DBKeychainTool saveValue:_titleTextField.text forKey:@"test"];

    
    _titleLabel.text=[DBKeychainTool getValueForKey:@"test"];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
