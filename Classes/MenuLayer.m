#import "MenuLayer.h"
#import "BoardLayer.h"
#import	"SinglePlayerSetupLayer.h"
#import "RulesLayer.h"
#import "JimBeamLayer.h"

@implementation MenuLayer

+(CCScene *) scene {
	CCScene *scene = [CCScene node];
	MenuLayer *layer = [MenuLayer node];
	[scene addChild: layer];
	return scene;
}

-(void) gotoBoard {
    [[CCDirector sharedDirector] pushScene:[BoardLayer scene]];
}

-(void) gotoSinglePlayerSetup {
    [[CCDirector sharedDirector] pushScene:[SinglePlayerSetupLayer scene]];
}

-(void) gotoRules {
    [[CCDirector sharedDirector] pushScene:[RulesLayer scene]];
}

-(void) gotoJimBeam {
    [[CCDirector sharedDirector] pushScene:[JimBeamLayer scene]];
}

-(id) init {
	if( (self=[super init])) {
		CCSprite * bg = [CCSprite spriteWithFile:@"bg2.png"];
		bg.position=ccp(160,240);
		[self addChild: bg];
		
		CCMenuItem *play=[CCMenuItemImage itemFromNormalImage:@"but10.png"
												 selectedImage:@"but10_.png" target:self selector:@selector(gotoBoard)];
		CCMenuItem *setup=[CCMenuItemImage itemFromNormalImage:@"but6.png"
												 selectedImage:@"but6_.png" target:self selector:@selector(gotoSinglePlayerSetup)];
		CCMenuItem *rules=[CCMenuItemImage itemFromNormalImage:@"but5.png"
												 selectedImage:@"but5_.png" target:self selector:@selector(gotoRules)];
		CCMenuItem *testlevel=[CCMenuItemImage itemFromNormalImage:@"redbuttonsm.png"
												 selectedImage:@"redbuttonpressedsm.png" target:self selector:@selector(gotoJimBeam)];
		CCMenu *menu=[CCMenu menuWithItems:play, setup, rules, testlevel, nil];
		menu.position=ccp(260,316);
		[menu alignItemsVertically];
		[self addChild:menu];
	}
	return self; 
}

- (void) dealloc {
	[super dealloc];
}

@end
