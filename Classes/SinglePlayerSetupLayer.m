#import "SinglePlayerSetupLayer.h"
#import "BoardLayer.h"
#import "MenuLayer.h"

@implementation SinglePlayerSetupLayer

+(CCScene *) scene {
	CCScene *scene = [CCScene node];
	SinglePlayerSetupLayer *layer = [SinglePlayerSetupLayer node];
	[scene addChild: layer];
	return scene;
}

-(void)gotoBoard {
    [[CCDirector sharedDirector] pushScene:[BoardLayer scene]];
}
-(void)gotoMenu {
	[[CCDirector sharedDirector] pushScene:[MenuLayer scene]];
}

-(id) init {
	if ( (self=[super initWithColor:ccc4(80,46,22,255)])) {
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Setup" fontName:@"Marker Felt" fontSize:20];
		CGSize size = [[CCDirector sharedDirector] winSize];
		label.position =  ccp( size.width /2 , size.height -20);
		[self addChild: label];
		
		CCMenuItem *item=[CCMenuItemImage itemFromNormalImage:@"but10.png"
				selectedImage:@"but10_.png" target:self selector:@selector(gotoBoard)];
		CCMenu *menu=[CCMenu menuWithItems:item, nil];
		menu.position=ccp(160,50);
		[menu alignItemsHorizontally];
		[self addChild:menu];
		
		CCMenuItem *item2=[CCMenuItemImage itemFromNormalImage:@"but9.png"
												selectedImage:@"but9_.png" 
													   target:self 
													 selector:@selector(gotoMenu)];
		CCMenu *menu2=[CCMenu menuWithItems:item2, nil];
		menu2.position=ccp(280, 15);
		[self addChild:menu2];
	}
	return self; 
}

- (void) dealloc {
	[super dealloc];
}

@end