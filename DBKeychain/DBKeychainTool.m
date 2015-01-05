//
//  DBKeychainTool.m
//  DBKeychain
//
//  Created by dengbin on 15/1/5.
//  Copyright (c) 2015年 IUAIJIA. All rights reserved.
//

#import "DBKeychainTool.h"
#import <Security/Security.h>
@implementation DBKeychainTool

+(NSMutableDictionary *)getKeychainQuery:(NSString *)key
{
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (__bridge_transfer id)kSecClassGenericPassword,(__bridge_transfer id)kSecClass,
            key,(__bridge_transfer id)kSecAttrService,
            key,(__bridge_transfer id)kSecAttrAccount,
            (__bridge_transfer id)kSecAttrAccessibleAfterFirstUnlock,(__bridge_transfer id)kSecAttrAccessible,
            nil];
}

+(void)saveValue:(id)value forKey:(NSString *)key
{
    NSMutableDictionary *dic_keychainQuery = [self getKeychainQuery:key];
    
    SecItemDelete((__bridge_retained CFDictionaryRef)dic_keychainQuery);
    
    [dic_keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:value] forKey:(__bridge_transfer id)kSecValueData];
    
    SecItemAdd((__bridge_retained CFDictionaryRef)dic_keychainQuery ,NULL);
    
}

+(id)getValueForKey:(NSString *)key
{
    id ret = nil;
    NSMutableDictionary *dic_keychainQuery = [self getKeychainQuery:key];
    
    [dic_keychainQuery setObject:(id)kCFBooleanTrue forKey:(__bridge_transfer id)kSecReturnData];
    
    [dic_keychainQuery setObject:(__bridge_transfer id)kSecMatchLimitOne forKey:(__bridge_transfer id)kSecMatchLimit];
    
    
    CFDataRef keyData =NULL;
    
    if (SecItemCopyMatching((__bridge_retained CFDictionaryRef)dic_keychainQuery, (CFTypeRef *)&keyData)== noErr)
    {
        @try {
            
            ret =[NSKeyedUnarchiver unarchiveObjectWithData:(__bridge_transfer NSData *)keyData];
        }
        @catch (NSException *exception) {
            NSLog(@"unarchive of %@ failed: %@",key,exception);
        }
        @finally {
            
        }
    }
    return ret;

}

+(void)deleteValueForKey:(NSString *)key
{
    NSMutableDictionary *dic_keychainQuery = [self getKeychainQuery:key];
    SecItemDelete((__bridge_retained CFDictionaryRef)dic_keychainQuery);

    
}

@end
