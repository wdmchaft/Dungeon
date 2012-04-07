#import "cocos2d.h"

@class State;

@interface Warrior : CCNode {
    State *currentState;
    int diamonds;
    int money;
    NSString *name;
}

@property (nonatomic, retain) State *currentState;
@property (nonatomic, assign) int diamonds;
@property (nonatomic, assign) int money;
@property (nonatomic, retain) NSString *name;

-(void)update;
-(void)changeState:(State *)newState;
-(id)initWithName:(NSString *)aName;

@end
