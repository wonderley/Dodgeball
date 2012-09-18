//
//  lesson1AppDelegate.h
//  lesson1
//
//  Created by Lucas Wonderley on 9/3/12.
//  Copyright University of Chicago 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface lesson1AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
