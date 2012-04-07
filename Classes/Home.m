#import "Home.h"
#import "Warrior.h"

@implementation Home

+ (id)shared {
    static id shared = nil;
    if (shared==nil) {
        shared=[[self alloc] init];
    }
    return shared;
}

-(void)enter:(Warrior *)warrior {
    NSLog(@"%@: Ah'm filthy rich. Never have to work a day in my life.", warrior.name);
}

-(void)execute:(Warrior *)warrior {
    NSLog(@"%@: Liv'n the good life. Yes siree", warrior.name);
}

-(void)exit:(Warrior *)warrior {
}

@end