//
//  MyCCSprite.m
//  lesson1
//
//  Created by Lucas Wonderley on 9/5/12.
//  Copyright 2012 University of Chicago. All rights reserved.
//

#import "MyCCSprite.h"
#import "CCActionInterval.h"
#import "CGPointExtension.h" 
#import "CCActionEase.h"
#import "CCDrawingPrimitives.h"
#import "cocos2d.h"

@implementation MyCCSprite


-(void) goToLocation: (CGPoint*) location {
	
	[self stopAllActions];
	CGPoint myPos = self.position;
	CGFloat rate = 300; 
	CGFloat distance = ccpDistance (myPos, *location);
	CGFloat duration = distance / rate;
	id move = [CCEaseIn actionWithAction:[CCMoveTo actionWithDuration:duration position:*location]];  
	[self runAction:move];
}

-(BOOL) doesCollideWithRect:(CGRect) rect { // needs update for circle-circle collision
	return CGRectIntersectsRect( [self boundingBox], rect );
}


@end
