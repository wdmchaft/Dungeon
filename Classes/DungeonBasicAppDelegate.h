#import <UIKit/UIKit.h>

@class RootViewController;

@interface DungeonBasicAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
