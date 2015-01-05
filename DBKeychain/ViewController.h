//
//  ViewController.h
//  DBKeychain
//
//  Created by dengbin on 15/1/5.
//  Copyright (c) 2015年 IUAIJIA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    
    __weak IBOutlet UITextField *_titleTextField;
    __weak IBOutlet UILabel *_titleLabel;
}


- (IBAction)buttonClick:(id)sender;

@end

