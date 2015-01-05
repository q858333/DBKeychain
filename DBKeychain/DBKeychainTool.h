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

//取数据
+(id)getValueForKey:(NSString *)key;

//删除数据
+(void)deleteValueForKey:(NSString *)key;

@end
