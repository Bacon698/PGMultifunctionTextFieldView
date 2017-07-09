//
//  QLHJMatchTool.h
//  QeelinGold-iOS
//
//  Created by MacBook on 2017/5/10.
//  Copyright © 2017年 chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QLHJMatchTool : NSObject


/**
 判断手机号格式是否正确

 @param mobile 传入的手机号
 @return 可用返回yes
 */
+ (BOOL)checkMobile:(NSString *)mobile;

+ (NSString *)getTimeFromTimeInterval:(NSString *)time;
#pragma 正则匹配邮箱
+ (BOOL) checkEmail:(NSString *)email;
#pragma 正则匹配手机号
+ (BOOL)checkTelNumber:(NSString *) telNumber;
#pragma 正则匹配用户密码6-16位数字和字母组合
+ (BOOL)checkLetterPassword:(NSString *) password;
#pragma 正则匹配用户姓名,20位的中文
+ (BOOL)checkUserName : (NSString *) userName;
#pragma 正则匹配用户身份证号
+ (BOOL)checkUserIdCard: (NSString *) idCard;
#pragma 正则验证码，6位数字
+ (BOOL)checkVerificationCode: (NSString *) code;
#pragma 正则匹配URL
+ (BOOL)checkURL : (NSString *) url;

@end
