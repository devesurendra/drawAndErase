//
//  Canvas.h
//  DrawAndErasePath
//
//  Created by sagarsoft on 14/07/16.
//  Copyright © 2016 sagarsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Canvas : UIImageView

@property (nonatomic, assign) CGPoint location;
@property (nonatomic, assign) BOOL draw;
@property (nonatomic, assign) BOOL erase;

@property (nonatomic, assign) BOOL scrollDisabled;

@end
