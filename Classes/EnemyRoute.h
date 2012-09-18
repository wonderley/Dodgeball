//
//  EnemyRoute.h
//  lesson1
//
//  Created by Lucas Wonderley on 9/15/12.
//  Copyright 2012 University of Chicago. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface EnemyRoute : NSObject {
	CGPoint initialPosition;
	NSMutableArray *pathArray;
}

@property CGPoint initialPosition;
@property (nonatomic, retain) CCAction* myRoute; // array of actions which is used to form a sequence


@end
