//
//  CircleNode.h
//  lesson1
//
//  Created by Lucas Wonderley on 9/17/12.
//  Copyright 2012 University of Chicago. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface CircleNode : CCNode {
	int radius;
	int colorCode;
	int priority;
	
}

@property (nonatomic, assign) int colorCode;
@property (nonatomic, assign) int priority;


-(id)init: (int)radius colorCode:(int)c priority:(int)pri;
-(void)draw;


@end