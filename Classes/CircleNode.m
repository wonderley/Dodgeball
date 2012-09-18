//
//  CircleNode.m
//  lesson1
//
//  Created by Lucas Wonderley on 9/17/12.
//  Copyright 2012 University of Chicago. All rights reserved.
//

#import "CircleNode.h"
#import "CCDrawingPrimitives.h"


@implementation CircleNode

@synthesize colorCode;
@synthesize priority;


-(id)init: (int)rad colorCode:(int)color priority:(int)pri {
	if( (self=[super init]) ) {
		radius = rad;
		self.colorCode = color;
		self.priority = pri;
		
		// set up the geometry of this sprite
		// this is necessary so the sprite indicates it's body size
		// relative the center point (position)
		CGSize size;
		size.width = 2 * rad;
		size.height = 2 * rad;
		self.contentSize = size;
		self.anchorPoint = ccp(0.0, 0.0);
		
	}
	return self;
}

-(void)draw {
	
	glLineWidth(4);
	
	
	//red
	if (colorCode == 0) {
		glColor4ub(255, 0, 0, 255);
	}
	// yellow
	if (colorCode == 1) {
		glColor4ub(255, 255, 0, 255);
	}
	// green
	if (colorCode == 2) {
		glColor4ub(0, 255, 0, 255);
	}
	CGPoint circleCenter = ccp(radius,radius);
	ccDrawCircle( circleCenter, radius, 0, 30, NO);
	
}

@end
