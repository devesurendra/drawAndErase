//
//  Canvas.m
//  DrawAndErasePath
//
//  Created by sagarsoft on 14/07/16.
//  Copyright © 2016 sagarsoft. All rights reserved.
//

#import "Canvas.h"

@implementation Canvas

@synthesize draw, erase, scrollDisabled;

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (scrollDisabled) {
        UITouch *touch = [touches anyObject];
        self.location = [touch locationInView:self];
    }
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if (scrollDisabled) {
        UITouch *touch = [touches anyObject];
        CGPoint currentLocation = [touch locationInView:self];
        
        UIGraphicsBeginImageContext(self.frame.size);
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        [self.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        CGContextSetLineCap(ctx, kCGLineCapRound);
        
        if (draw) {
            CGContextSetLineWidth(ctx, 5.0);
            CGContextSetRGBStrokeColor(ctx, 1.0, 0.0, 0.0, 1.0);
        }
        else {
            NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"imgKey"];
            UIImage* image = [UIImage imageWithData:imageData];
            
            CGContextSetLineWidth(ctx, 10.0);
            CGContextSetStrokeColorWithColor(ctx, [[UIColor alloc]initWithPatternImage:image].CGColor);
        }
        CGContextBeginPath(ctx);
        CGContextMoveToPoint(ctx, self.location.x, self.location.y);
        CGContextAddLineToPoint(ctx, currentLocation.x, currentLocation.y);
        CGContextStrokePath(ctx);
        
        self.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        self.location = currentLocation;
    }
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (scrollDisabled) {
        UITouch *touch = [touches anyObject];
        CGPoint currentLocation = [touch locationInView:self];
        
        UIGraphicsBeginImageContext(self.frame.size);
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        [self.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        CGContextSetLineCap(ctx, kCGLineCapRound);
        
        if (draw) {
            CGContextSetLineWidth(ctx, 5.0);
            CGContextSetRGBStrokeColor(ctx, 1.0, 0.0, 0.0, 1.0);
        }
        else {
            NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"imgKey"];
            UIImage* image = [UIImage imageWithData:imageData];
            
            CGContextSetLineWidth(ctx, 10.0);
            CGContextSetStrokeColorWithColor(ctx, [[UIColor alloc]initWithPatternImage:image].CGColor);
        }
        CGContextBeginPath(ctx);
        CGContextMoveToPoint(ctx, self.location.x, self.location.y);
        CGContextAddLineToPoint(ctx, currentLocation.x, currentLocation.y);
        CGContextStrokePath(ctx);
        
        self.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        self.location = currentLocation;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
