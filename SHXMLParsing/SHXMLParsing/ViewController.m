//
//  ViewController.m
//  SHXMLParsing
//
//  Created by Li Zhe on 10/7/16.
//  Copyright © 2016 SH10. All rights reserved.
//

#import "ViewController.h"
#import "XMLUtil.h"

@interface ViewController () <XMLUtilDelegate>

@property (nonatomic, strong) XMLUtil *xmlUtil;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _xmlUtil = [[XMLUtil alloc] init];
    _xmlUtil.delegate = self;
    
    self.textView.text = @"";
    self.dataArray = [[NSMutableArray alloc] initWithCapacity:0];
}


- (void)openXMLFile {
    
    //NSArray *fileTypes = [NSArray arrayWithObject:@"xml"];
}

#pragma mark - XMLUtilDelegate
- (void)didParsedWithDataArray:(NSMutableArray *)array {
    self.dataArray = array;
    //NSLog(@"print student info: %@", self.dataArray);
    //self.textView.text = [NSString stringWithFormat:@"%@", _dataArray];
    NSMutableString *_mutableStr = [[NSMutableString alloc] initWithString:@""];
    
    for (Person *stud in _dataArray) {
        
        NSString *item = [NSString stringWithFormat:@"Id: %@, Name: %@, Gender:%@, Age:%@\n", stud.pid, stud.name, stud.gender, stud.age];
        [_mutableStr appendString:item];
    }
    
    self.textView.text = _mutableStr;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nsXMLParser:(id)sender {
    
    [_xmlUtil parser];
    //NSLog(@"print student info: %@", self.dataArray);
}

- (IBAction)gdataXMLParser:(id)sender {
}
@end
