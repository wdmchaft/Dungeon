#import "Mine.h"
#import "Warrior.h"
#import "Bank.h"

@implementation Mine
+ (id)shared {
    static id shared = nil;
    if (shared==nil) {
        shared=[[self alloc] init];
    }
    return shared;
}

-(void)enter:(Warrior *)warrior {
    NSLog(@"%@: Walkin' to the diamond mine",warrior.name);
    
}

-(void)execute:(Warrior *)warrior {
    NSLog(@"%@: Pickin' up a diamond",warrior.name);
    warrior.diamonds=warrior.diamonds+1;
    if (warrior.diamonds>=3) {
        [warrior changeState:[Bank shared]];
    }
}

-(void)exit:(Warrior *)warrior {
    NSLog(@"%@: Walkin' to the bank with mah pockets full o' precious stones",warrior.name);
}

@end
