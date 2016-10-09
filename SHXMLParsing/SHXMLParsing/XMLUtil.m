//
//  XMLUtil.m
//  SHXMLParsing
//
//  Created by Li Zhe on 10/9/16.
//  Copyright © 2016 SH10. All rights reserved.
//

#import "XMLUtil.h"

@implementation XMLUtil

- (instancetype)init {
    
    if (self = [super init]) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"text" ofType:@"xml"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        self.xmlParser = [[NSXMLParser alloc] initWithData:data];
        self.xmlParser.delegate = self;
        
        self.listArr = [NSMutableArray arrayWithCapacity:5];
    }
    
    return self;
}

#pragma mark - NSXMLParserDelegate
// Document handling methods
- (void)parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"parser Did Start document...");
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName attributes:(NSDictionary<NSString *, NSString *> *)attributeDict {
    
    self.currentElement = elementName;
    if ([self.currentElement isEqualToString:@"student"]) {
        self.person = [[Person alloc] init];
    }
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if ([self.currentElement isEqualToString:@"pid"]) {
        [self.person setPid:string];
    }
    else if ([self.currentElement isEqualToString:@"name"]) {
        [self.person setName:string];
    }
    else if ([self.currentElement isEqualToString:@"gender"]) {
        [self.person setGender:string];
    }
    else if ([self.currentElement isEqualToString:@"age"]) {
        [self.person setAge:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName {
    
    if ([elementName isEqualToString:@"student"]) {
        [self.listArr addObject:self.person];
    }
    
    self.currentElement = nil;
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@" The parser has completed parsing and it was successful.");
    if ([self.delegate respondsToSelector:@selector(didParsedWithDataArray:)]) {
        [self.delegate didParsedWithDataArray:self.listArr];
        NSLog(@"delegata");
    }
}

- (void)parser {
    [self.xmlParser parse];
    NSLog(@"parsing parsing");
}
@end
