#import "BoardLayer.h"
#import "Token.h"
#import "MenuLayer.h"

@implementation BoardLayer
@synthesize tokenGroup;

+(id) scene {
	CCScene *scene = [CCScene node];
	BoardLayer *layer = [BoardLayer node];
	[scene addChild: layer];
	return scene;
}


-(void) checkForTap:(CGPoint) touch {
	int i;
	BOOL yesOrNo = NO;
	for (i = 0; i < [tokenGroup count]; i++) {
		Token *token = (Token *)[tokenGroup objectAtIndex:i];
		BOOL tokenTapped = [self circle:touch 
							 withRadius:1 
					collisionWithCirlce:CGPointMake(token.position.x, token.position.y) 
			  collisionWithCircleRadius:4];
		if (tokenTapped) {
			yesOrNo = YES;
			[self removeChild:token cleanup:NO];
			[tokenGroup removeObjectAtIndex:i];
		}
	}
	if (yesOrNo == NO) {
		Token *addedToken = [[Token alloc] init];
		addedToken.position = ccp(touch.x, touch.y);
		[tokenGroup addObject:addedToken];
		[self addChild:addedToken];
	}
}

-(BOOL) circle:(CGPoint) center withRadius:(float)radius 
						collisionWithCirlce:(CGPoint) newcenter 
						collisionWithCircleRadius:(float) newradius {
	float xdif = center.x - newcenter.x;
	float ydif = center.y - newcenter.y;
	float distance = sqrt(xdif*xdif+ydif*ydif);
	if (distance <= radius + newradius) return YES;
		return NO;
}

-(void) gotoMenu {
	[[CCDirector sharedDirector] pushScene:[MenuLayer scene]];
}

-(id) init {
	if ( (self=[super initWithColor:ccc4(80,46,22,255)])) {
		self.isTouchEnabled = YES;

		NSMutableArray *array = [[NSMutableArray alloc] init];
		self.tokenGroup = array;
		[array release];

		CCMenuItem *item=[CCMenuItemImage itemFromNormalImage:@"but9.png"
												selectedImage:@"but9_.png" 
													   target:self 
													 selector:@selector(gotoMenu)];
		CCMenu *menu=[CCMenu menuWithItems:item, nil];
		menu.position=ccp(280, 15);
		[self addChild:menu];
		
	}
	return self;
}

-(void) ccTouchesBegan:(NSSet *) touches withEvent:(UIEvent *) event {
	UITouch *myTouch = [touches anyObject];
	CGPoint myPoint = [myTouch locationInView:[myTouch view]];
	CGPoint myConvert = [[CCDirector sharedDirector] convertToGL:myPoint];
	[self checkForTap:myConvert];
}

- (void) dealloc {
	[super dealloc];
}

@end

