#import "Token.h"

@implementation Token

-(id) init {
	if ((self = [super init])) {
		CCSprite *token = [CCSprite spriteWithFile:@"dude1.png"];
		[self addChild:token];
	}
	return self;
}

@end
