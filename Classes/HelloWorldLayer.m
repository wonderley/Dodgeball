//
//  HelloWorldLayer.m
//  lesson1
//
//  Created by Lucas Wonderley on 9/3/12.
//  Copyright University of Chicago 2012. All rights reserved.
//

#include <stdlib.h>

// Import the interfaces
#import "HelloWorldLayer.h"
#import "CCTouchDispatcher.h"
#import "MyCCSprite.h"
#import "CircleNode.h"
#import "CCActionInterval.h"
#import "EnemyRoute.h"



// HelloWorldLayer implementation
@implementation HelloWorldLayer

@synthesize CENTER_POS;
@synthesize ENEMY_POS1;
@synthesize cocosGuy;
@synthesize guyCircle;
@synthesize enemies;
@synthesize scoreLabel;
@synthesize highScoreLabel;
@synthesize guyTouch;
@synthesize touchToIgnore;

#define NUMBER_OF_ROUTE_CODES 10
BOOL guyHasBeenMoved = NO;
NSInteger score = 0;
NSInteger highScore = 0;


+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{

	if( (self=[super initWithColor:ccc4(255,255,255,255)])) {
		
		CENTER_POS = ccp ( self.contentSize.width/2, self.contentSize.height/2 );

		cocosGuy = [MyCCSprite node];
		[cocosGuy setTextureRect: CGRectMake(0, 0, 50, 50)];
    //    [cocosGuy setColor: (ccRED)]; use for shield powerup?
		cocosGuy.position = CENTER_POS;
		[cocosGuy setOpacity: 0];
		guyCircle = [[CircleNode alloc] init: 25 colorCode: 2 priority: 0];
		
		[cocosGuy addChild: guyCircle];
        [self addChild:cocosGuy];
		
		scoreLabel= [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", 0] fontName:@"marker felt" fontSize:25];
		scoreLabel.position=ccp(30, scoreLabel.contentSize.height);
		scoreLabel.color=ccBLACK;
		[self addChild: scoreLabel];
		highScoreLabel= [CCLabelTTF labelWithString:[NSString stringWithFormat:@"High Score: %d", 0] fontName:@"marker felt" fontSize:25];
		highScoreLabel.position=ccp(self.contentSize.width - highScoreLabel.contentSize.width, highScoreLabel.contentSize.height);
		highScoreLabel.color=ccBLACK;
		[self addChild: highScoreLabel];
		
		[self startGame];
	

		
		[self schedule: @selector(nextFrame:)];
		self.isTouchEnabled = YES;
	}
	return self;
}

-(void) startGame {
	[cocosGuy stopAllActions];
	touchToIgnore = guyTouch;
	if (score > highScore)
	{
		highScore = score;
		[highScoreLabel setString: [NSString stringWithFormat:@"High Score: %d", highScore]];
	}
	score = 0;
	enemies = [[NSMutableArray alloc] init ];
	cocosGuy.position = CENTER_POS;
	guyHasBeenMoved = NO;
}

-(void) addEnemy {
	CCSprite *enemy = [CCSprite node];
	[enemy setTextureRect: CGRectMake(0, 0, 50, 50)];
	[enemy setOpacity: 0];
	CircleNode *newCirc = [[CircleNode alloc] init: 25 colorCode: 0 priority: 0];
	[enemy addChild: newCirc];
	[enemies addObject: enemy];
	EnemyRoute *route = [self makeRoute: arc4random() % NUMBER_OF_ROUTE_CODES];
	[enemy setPosition: [route initialPosition]];
	[self addChild: enemy];
		[enemy runAction: [route myRoute]];
}

-(EnemyRoute*) makeRoute:(NSInteger) routeCode {
	
	CGPoint point;
	ccBezierConfig bezierconf;
	EnemyRoute *route;
	
	if (routeCode == 1)
	{
		point = ccp( -50, self.contentSize.height * 1/4 );
		bezierconf.controlPoint_1 = ccp(-200, 5);
		bezierconf.controlPoint_2 = ccp(300, 100);
		bezierconf.endPosition = ccp(1000,5);
	}
		
	else if (routeCode == 2)
	{
		point = ccp( -50, self.contentSize.height * 1/2 );
		bezierconf.controlPoint_1 = ccp(-200, 5);
		bezierconf.controlPoint_2 = ccp(300, 100);
		bezierconf.endPosition = ccp(1000,5);
	}
	
	else if (routeCode == 3)
	{
		point = ccp( -50, self.contentSize.height * 3/4 );
		bezierconf.controlPoint_1 = ccp(-200, 5);
		bezierconf.controlPoint_2 = ccp(300, 100);
		bezierconf.endPosition = ccp(1000,5);	}
	
	else if (routeCode == 4)
	{
		point = ccp( self.contentSize.width * 1/4, -50 );
		bezierconf.controlPoint_1 = ccp(5, -200);
		bezierconf.controlPoint_2 = ccp(5, 300);
		bezierconf.endPosition = ccp(self.contentSize.width * 1/4, 800);
	}
	
	
	else if (routeCode == 5)
	{
		point = ccp( self.contentSize.width * 2/4, -50 );
		bezierconf.controlPoint_1 = ccp(5, -200);
		bezierconf.controlPoint_2 = ccp(5, 300);
		bezierconf.endPosition = ccp(self.contentSize.width * 1/4, 800);
	}
	
	else if (routeCode == 6)
	{
		point = ccp( self.contentSize.width * 3/4, -50 );
		bezierconf.controlPoint_1 = ccp(5, -200);
		bezierconf.controlPoint_2 = ccp(5, 300);
		bezierconf.endPosition = ccp(self.contentSize.width * 1/4, 800);
		
	}
	
	else if (routeCode == 7)
	{
		point = ccp( self.contentSize.width, -50 );
		bezierconf.controlPoint_1 = ccp(0, self.contentSize.height);
		bezierconf.controlPoint_2 = ccp(-self.contentSize.width, self.contentSize.height);
		bezierconf.endPosition = ccp(-self.contentSize.width, 0);
	}
	
	else if (routeCode == 8)
	{
		point = ccp( self.contentSize.width * 1/4, -50 );
		bezierconf.controlPoint_1 = ccp(5, self.contentSize.height * 3/4);
		bezierconf.controlPoint_2 = ccp(self.contentSize.width * 1/2, self.contentSize.height * 5/6);
		bezierconf.endPosition = ccp(self.contentSize.width * 1/2, self.contentSize.height + 100);
		
	}
	
	else if (routeCode == 9)
	{
		point = ccp( -50, self.contentSize.height -70 );
		bezierconf.controlPoint_1 = ccp(self.contentSize.width, 0);
		bezierconf.controlPoint_2 = ccp(self.contentSize.width * 5/6, -self.contentSize.height + 70);
		bezierconf.endPosition = ccp(0, -1 * self.contentSize.height + 100);
	}
	
	else //(routeCode == 10)
	{
		point = ccp( self.contentSize.width * 1/6, self.contentSize.height + 50 );
		bezierconf.controlPoint_1 = ccp(self.contentSize.width * 1/6, -self.contentSize.height + 100);
		bezierconf.controlPoint_2 = ccp(self.contentSize.width * 5/6, -self.contentSize.height);
		bezierconf.endPosition = ccp(self.contentSize.width * 2/3, 0);
	}
	
	route = [[EnemyRoute alloc] init];
	route.initialPosition = point;
	route.myRoute = [[CCBezierBy actionWithDuration: 3 bezier: bezierconf] retain];
	return route;
	

}

-(void) registerWithTouchDispatcher
{
	[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
	CGPoint location = [self convertTouchToNodeSpace: touch];
	if (CGRectContainsPoint([cocosGuy boundingBox], location ) )
	{
		guyTouch = event;
		[cocosGuy runAction:[CCEaseIn actionWithAction:[CCMoveTo actionWithDuration:0
																		   position:location]]];
		guyHasBeenMoved = YES;
		return YES;
	}
	return NO;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
	if (guyHasBeenMoved) // prevent touches from carrying through when game restarts
	{
		CGPoint location = [self convertTouchToNodeSpace: touch];
		[cocosGuy runAction:[CCEaseIn actionWithAction:[CCMoveTo actionWithDuration:0
																		position:location]]];
	}
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {

}

- (void) nextFrame:(ccTime)dt {
	int indexCount = 0;
	if (score % 100 == 0)
	{
		[self addEnemy];
	}
	++score;
	[scoreLabel setString: [NSString stringWithFormat:@"%d", score]];
	for (CCSprite *e in enemies) {
		if ([cocosGuy doesCollideWithRect: [e boundingBox]])
		{
			for (CCSprite *e in enemies)
			{
				[self removeChild: e cleanup: YES];
			}
			[self startGame];
		}
		if ([e numberOfRunningActions] == 0)
		{
			EnemyRoute *route = [self makeRoute: arc4random() % NUMBER_OF_ROUTE_CODES];
			[e setPosition: [route initialPosition]];
			[e runAction: [route myRoute]];
		}
		++indexCount;
	}

	
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
