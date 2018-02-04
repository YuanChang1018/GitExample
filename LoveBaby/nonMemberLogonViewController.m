//
//  nonMemberLogonViewController.m
//  LoveBaby
//
//  Created by 呂 原彰 on 2018/1/29.
//  Copyright © 2018年 seae2145. All rights reserved.
//

#import "nonMemberLogonViewController.h"

@interface nonMemberLogonViewController ()

@end

@implementation nonMemberLogonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //Back返回鍵
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationController.navigationBar.backIndicatorImage =[UIImage imageNamed:@"back"];
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage =[UIImage imageNamed:@"back"];
    self.navigationItem.backBarButtonItem = backButtonItem;
    
    //暗沈背景 隱藏
    self.nonBackView.hidden = YES;
    
    //轉動UI動畫暫停
    [self.nonLoginActivity stopAnimating];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


//搖動TextField
-(void)lockAnimationForView:(UIView*)view
{
    //搖動動畫設定
    CALayer *lbl = [view layer];
    CGPoint posLbl = [lbl position];
    CGPoint y = CGPointMake(posLbl.x-10, posLbl.y);
    CGPoint x = CGPointMake(posLbl.x+10, posLbl.y);
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setTimingFunction:[CAMediaTimingFunction
                                  functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [animation setFromValue:[NSValue valueWithCGPoint:x]];
    [animation setToValue:[NSValue valueWithCGPoint:y]];
    [animation setAutoreverses:YES];
    //搖動間隔秒
    [animation setDuration:0.08];
    //搖動次數
    [animation setRepeatCount:3];
    [lbl addAnimation:animation forKey:nil];
}

- (IBAction)nonMemberLogin:(id)sender {
    
    //暗沈背景 顯現
    self.nonBackView.hidden = NO;
    //啟動轉動畫面
    [self.nonLoginActivity startAnimating];
    
    //關閉鍵盤
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder)
                                               to:nil
                                             from:nil
                                         forEvent:nil];
    
    
    //當帳號字數少於1
    if (self.nonmemberAccountText.text.length < 1){
        
        //暗沈背景 隱藏
        self.nonBackView.hidden = YES;
        
        //轉動UI動畫暫停
        [self.nonLoginActivity stopAnimating];
        //帳號TextView 搖動
        [self lockAnimationForView:self.nonmemberEmailText];
        
        
        //當密碼字數少於1
    }else if (self.nonmemberEmailText.text.length < 1){
        
        //暗沈背景 隱藏
        self.nonBackView.hidden = YES;
        //轉動UI動畫暫停
        [self.nonLoginActivity stopAnimating];
        //密碼TextView 搖動
        [self lockAnimationForView:self.nonmemberEmailText];
        
    }else{
        
        CATransition *animation = [CATransition animation];
        animation.duration = 1.0;
        animation.timingFunction = UIViewAnimationCurveEaseInOut;
        animation.type = kCATransitionFade;
        animation.subtype = kCATransitionFromLeft;
        [self.view.window.layer addAnimation:animation forKey:nil];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    
}


@end
