//
//  XMLUtil.h
//  SHXMLParsing
//
//  Created by Li Zhe on 10/9/16.
//  Copyright © 2016 SH10. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@protocol XMLUtilDelegate <NSObject>

- (void)didParsedWithDataArray:(NSMutableArray *)array;

@end

@interface XMLUtil : NSObject <NSXMLParserDelegate>

@property (nonatomic, strong) NSXMLParser *xmlParser;
@property (nonatomic, strong) Person *person;

@property (nonatomic, strong) NSMutableArray *listArr;
@property (nonatomic, copy) NSString *currentElement;

@property (nonatomic, assign) id <XMLUtilDelegate> delegate;

- (void)parser;
@end
