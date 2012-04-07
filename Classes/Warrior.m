#import "Warrior.h"
#import "Mine.h"

@implementation Warrior
@synthesize diamonds, money, name, currentState;

-(void) update {
    if (currentState!=nil) {
        [currentState execute:self];
    }
}

-(void)changeState:(State *)newState {
    [currentState enter:self];
    self.currentState=newState;
    [currentState exit:self];
}

-(id)initWithName:(NSString *)aName {
	if( (self=[super init]) ) {
        diamonds=0;
        money=0;
        self.currentState=[Mine shared];
        self.name=aName;
	}
	return self;
}

- (void) dealloc {
    self.name=nil;
    self.currentState=nil;
	[super dealloc];
}

@end
