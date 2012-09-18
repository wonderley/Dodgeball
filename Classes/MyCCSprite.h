//
//  MyCCSprite.h
//  lesson1
//
//  Created by Lucas Wonderley on 9/5/12.
//  Copyright 2012 University of Chicago. All rights reserved.
//

#import "CCSprite.h"

@interface MyCCSprite : CCSprite 



-(void) goToLocation: (CGPoint*) location;

-(BOOL) doesCollideWithRect:(CGRect) rect;



@end
