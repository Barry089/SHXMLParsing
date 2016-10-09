//
//  ViewController.h
//  SHXMLParsing
//
//  Created by Li Zhe on 10/7/16.
//  Copyright © 2016 SH10. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *textView;

- (IBAction)nsXMLParser:(id)sender;
- (IBAction)gdataXMLParser:(id)sender;
@end

