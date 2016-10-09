//
//  Person.m
//  SHXMLParsing
//
//  Created by Li Zhe on 10/9/16.
//  Copyright © 2016 SH10. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithPid:(NSString *)aPid name:(NSString *)aName gender:(NSString *)aGender age:(NSString *)aAge {
    
    if (self = [super init]) {
        self.pid = aPid;
        self.name = aName;
        self.gender = aGender;
        self.age = aAge;
    }
    
    return self;
}

+ (instancetype)studWithPid:(NSString *)aPid name:(NSString *)aName gender:(NSString *)aGender age:(NSString *)aAge {
    return [[self alloc] initWithPid:aPid name:aName gender:aGender age:aAge];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@, %@, %@, %@", self.pid, self.name, self.gender, self.age];
}

@end
