//
//  HelloWorldLayer.h
//  lesson1
//
//  Created by Lucas Wonderley on 9/3/12.
//  Copyright University of Chicago 2012. All rights reserved.
//

#import "cocos2d.h"
#import "MyCCSprite.h"
#import "CircleNode.h"
#import "EnemyRoute.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayerColor {
	
}

@property (nonatomic, retain) MyCCSprite *cocosGuy;
@property (nonatomic, retain) CircleNode *guyCircle;
@property (nonatomic, retain) NSMutableArray *enemies; // all enemies currently active
@property CGPoint CENTER_POS;
@property CGPoint ENEMY_POS1;
@property (nonatomic, retain) CCLabelTTF *scoreLabel;
@property (nonatomic, retain) CCLabelTTF *highScoreLabel;
@property (nonatomic, retain) UIEvent *guyTouch; // current touch controlling the guy
@property (nonatomic, retain) UIEvent *touchToIgnore; // active touch from previous game

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
-(EnemyRoute*) makeRoute:(NSInteger) routeCode;
-(void) startGame;

@end
