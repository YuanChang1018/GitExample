//
//  nonMemberLogonViewController.h
//  LoveBaby
//
//  Created by 呂 原彰 on 2018/1/29.
//  Copyright © 2018年 seae2145. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface nonMemberLogonViewController : UIViewController
- (IBAction)nonMemberLogin:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *nonmemberAccountText;
@property (strong, nonatomic) IBOutlet UITextField *nonmemberEmailText;
@property (strong, nonatomic) IBOutlet UIView *nonBackView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *nonLoginActivity;


@end
