#import "RulesLayer.h"
#import "MenuLayer.h"

@implementation RulesLayer

+(CCScene *) scene {
	CCScene *scene = [CCScene node];
	RulesLayer *layer = [RulesLayer node];
	[scene addChild: layer];
	return scene;
}

-(void) gotoRules {
	[[CCDirector sharedDirector] pushScene:[RulesLayer scene]];
}

-(void) gotoMenu {
	[[CCDirector sharedDirector] pushScene:[MenuLayer scene]];
}

-(id) init {
	if ( (self=[super initWithColor:ccc4(80,46,22,255)])) {
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Rules" fontName:@"Marker Felt" fontSize:20];
		CGSize size = [[CCDirector sharedDirector] winSize];
		label.position =  ccp( size.width /2 , size.height -20);
		[self addChild: label];
		
		CCMenuItem *objective=[CCMenuItemImage itemFromNormalImage:@"objective.png"
													 selectedImage:@"objective2.png" 
															target:self 
														  selector:@selector(gotoRules)];
		CCMenuItem *doors=[CCMenuItemImage itemFromNormalImage:@"doors.png"
													 selectedImage:@"doors2.png" 
															target:self 
														  selector:@selector(gotoRules)];
		CCMenuItem *movement=[CCMenuItemImage itemFromNormalImage:@"movement.png"
													 selectedImage:@"movement2.png" 
															target:self 
														  selector:@selector(gotoRules)];
		CCMenuItem *combat=[CCMenuItemImage itemFromNormalImage:@"combat.png"
													 selectedImage:@"combat2.png" 
															target:self 
														  selector:@selector(gotoRules)];
		CCMenuItem *table=[CCMenuItemImage itemFromNormalImage:@"table.png"
												  selectedImage:@"table2.png" 
														 target:self 
													   selector:@selector(gotoRules)];
		CCMenu *menu=[CCMenu menuWithItems:objective, doors, movement, table, combat, nil];
		menu.position=ccp(46, 80);
		[menu alignItemsVertically];
		[self addChild:menu];
		
		CCMenuItem *item=[CCMenuItemImage itemFromNormalImage:@"but9.png"
												selectedImage:@"but9_.png" 
													   target:self 
													 selector:@selector(gotoMenu)];
		CCMenu *menu2=[CCMenu menuWithItems:item, nil];
		menu2.position=ccp(280, 15);
		[self addChild:menu2];
	}
	return self;
}

- (void) dealloc {
	[super dealloc];
	
}@end