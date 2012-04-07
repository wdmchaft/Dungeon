#import "State.h"
#import "Warrior.h"

@implementation State

-(void)enter:(Warrior *)warrior {
    [self doesNotRecognizeSelector:_cmd];
}

-(void)execute:(Warrior *)warrior {
    [self doesNotRecognizeSelector:_cmd];
}

-(void)exit:(Warrior *)warrior {
    [self doesNotRecognizeSelector:_cmd];
}

@end
