//
//  ViewController.m
//  DrawAndErasePath
//
//  Created by sagarsoft on 14/07/16.
//  Copyright © 2016 sagarsoft. All rights reserved.
//

#import "ViewController.h"
#import "Canvas.h"

@interface ViewController ()
@property (nonatomic, strong) Canvas *imgVwMain;

@end

@implementation ViewController

@synthesize scrlVwMain, imgVwMain, btnDraw, btnErase;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [NSThread detachNewThreadSelector:@selector(loadImageInBackground) toTarget:self withObject:nil];
    
    imgVwMain = [[Canvas alloc] init];
    [scrlVwMain addSubview:imgVwMain];
    [imgVwMain setTranslatesAutoresizingMaskIntoConstraints:NO];
    [imgVwMain setUserInteractionEnabled:YES];
    
    NSArray *imgVwConstX = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[imgVwMain]-0-|" options:0 metrics:nil views:@{@"imgVwMain": imgVwMain}];
    NSArray *imgVwConstY = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[imgVwMain]-0-|" options:0 metrics:nil views:@{@"imgVwMain": imgVwMain}];
    
    [scrlVwMain addConstraints:imgVwConstX];
    [scrlVwMain addConstraints:imgVwConstY];
    
    imgVwMain.draw = NO;
    imgVwMain.erase = NO;
}

-(void)loadImageInBackground {
    NSURL *url = [[NSURL alloc] initWithString:@"https://nirklars.files.wordpress.com/2015/02/exomoon_of_binary_red_dwarfs__2_by_nirklars-d86asrr.png"];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    UIImage *image = [[UIImage alloc] initWithData:data];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [imgVwMain setImage:image];
    });
    
    [[NSUserDefaults standardUserDefaults] setObject:UIImagePNGRepresentation(image) forKey:@"imgKey"];
}

- (IBAction)btnDrawAction:(id)sender {
    imgVwMain.draw = !imgVwMain.draw;
    if (imgVwMain.erase) {
        imgVwMain.erase = NO;
        [btnErase setBackgroundColor:[UIColor clearColor]];
    }
    if (imgVwMain.draw) {
        [scrlVwMain setScrollEnabled:NO];
        imgVwMain.scrollDisabled = YES;
        [btnDraw setBackgroundColor:[UIColor yellowColor]];
    }
    else {
        [scrlVwMain setScrollEnabled:YES];
        imgVwMain.scrollDisabled = NO;
        [btnDraw setBackgroundColor:[UIColor clearColor]];
    }
}

- (IBAction)btnEraseAction:(id)sender {
    imgVwMain.erase = !imgVwMain.erase;
    if (imgVwMain.draw) {
        imgVwMain.draw = NO;
        [btnDraw setBackgroundColor:[UIColor clearColor]];
    }
    if (imgVwMain.erase) {
        [scrlVwMain setScrollEnabled:NO];
        imgVwMain.scrollDisabled = YES;
        [btnErase setBackgroundColor:[UIColor yellowColor]];
    }
    else {
        [scrlVwMain setScrollEnabled:YES];
        imgVwMain.scrollDisabled = NO;
        [btnErase setBackgroundColor:[UIColor clearColor]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
