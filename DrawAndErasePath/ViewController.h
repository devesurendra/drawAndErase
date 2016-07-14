//
//  ViewController.h
//  DrawAndErasePath
//
//  Created by sagarsoft on 14/07/16.
//  Copyright © 2016 sagarsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scrlVwMain;
@property (weak, nonatomic) IBOutlet UIButton *btnDraw;
@property (weak, nonatomic) IBOutlet UIButton *btnErase;

- (IBAction)btnDrawAction:(id)sender;
- (IBAction)btnEraseAction:(id)sender;

@end

