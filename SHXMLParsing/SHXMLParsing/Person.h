//
//  Person.h
//  SHXMLParsing
//
//  Created by Li Zhe on 10/9/16.
//  Copyright © 2016 SH10. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, copy) NSString *pid;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *age;

- (instancetype)initWithPid:(NSString *)aPid name:(NSString *)aName gender:(NSString *)aGender age:(NSString *)aAge;
+ (instancetype)studWithPid:(NSString *)aPid name:(NSString *)aName gender:(NSString *)aGender age:(NSString *)aAge;
@end
