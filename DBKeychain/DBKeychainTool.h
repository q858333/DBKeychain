//
//  DBKeychainTool.h
//  DBKeychain
//
//  Created by dengbin on 15/1/5.
//  Copyright (c) 2015年 IUAIJIA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBKeychainTool : NSObject

//存数据
+(void)saveValue:(id)value forKey:(NSString *)key;



@end
