#import "cocos2d.h"
#import "Warrior.h"

@interface JimBeamLayer : CCLayerColor {
	Warrior *floid;
	Warrior *devon;
	CCSprite *player01;
}

+(CCScene *) scene;

@end
