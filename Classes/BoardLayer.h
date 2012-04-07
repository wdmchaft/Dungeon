#import "cocos2d.h"

@interface BoardLayer : CCLayerColor {
	NSMutableArray *tokenGroup;
}

@property (nonatomic, retain) NSMutableArray *tokenGroup;

+(id) scene;
-(void) checkForTap:(CGPoint) touch;
-(BOOL) circle:(CGPoint) center withRadius:(float) radius collisionWithCirlce:(CGPoint) newcenter collisionWithCircleRadius:(float) radiusTwo;


@end
