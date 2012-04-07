#import "JimBeamLayer.h"
#import "MenuLayer.h"

@implementation JimBeamLayer

+(CCScene *) scene {
	CCScene *scene = [CCScene node];
	JimBeamLayer *layer = [JimBeamLayer node];
	[scene addChild: layer];
	return scene;
}

-(void)floidUpdate {
    [floid update];
}

-(void)devonUpdate {
    [devon update];
}

-(void) gotoMenu {
	[[CCDirector sharedDirector] pushScene:[MenuLayer scene]];
}

-(id) init {
	if ( (self=[super initWithColor:ccc4(80,46,22,255)])) {
		self.isTouchEnabled=YES;
		
		CCSprite *board = [CCSprite spriteWithFile:@"board5.png"];
		board.position=ccp(160,250);
		[self addChild: board];
		
		player01 = [CCSprite spriteWithFile:@"dude1.png"];
		player01.position = ccp(100,250);
		[self addChild:player01];
		
		floid=[[Warrior alloc] initWithName:@"Floid The Warrior"]; 
        [self schedule:@selector(floidUpdate) interval:3.0];
        
        devon=[[Warrior alloc] initWithName:@"Devon The Warrior"]; 
        [self schedule:@selector(devonUpdate) interval:5.0];

		CCMenuItem *item=[CCMenuItemImage itemFromNormalImage:@"but9.png"
												selectedImage:@"but9_.png"
													   target:self 
													 selector:@selector(gotoMenu)];
		CCMenu *menu=[CCMenu menuWithItems:item, nil];
		menu.position=ccp(300, 15);
		[self addChild:menu];
		/*
		CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"Just starting." fontName:@"Marker Felt" fontSize:18];
		CGSize size = [[CCDirector sharedDirector] winSize];
		label2.position =  ccp(size.width/2,14);
		[self addChild: label2];
		 */
	}
	return self;
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch=[touches anyObject];
	CGPoint location = [touch locationInView: [touch view]];
	CGPoint convertedLocation = [[CCDirector sharedDirector]convertToGL:location];
	[player01 stopAllActions];
	[player01 runAction:[CCMoveTo actionWithDuration:0.2 position:convertedLocation]];
	CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"Good. Now move at most 5 spaces." fontName:@"Marker Felt" fontSize:18];
	CGSize size = [[CCDirector sharedDirector] winSize];
	label2.position =  ccp(size.width/2,14);
	[self addChild: label2];
}

-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch=[touches anyObject];
	CGPoint location = [touch locationInView: [touch view]];
	CGPoint convertedLocation = [[CCDirector sharedDirector]convertToGL:location];
	[player01 stopAllActions];
	[player01 runAction:[CCMoveTo actionWithDuration:0.2 position:convertedLocation]];
}

- (void) dealloc {
	[super dealloc];
}

@end