#import "Gallery.h"
#import "Warrior.h"
#import "Mine.h"
#import "Home.h"

@implementation Gallery
+ (id)shared {
    static id shared = nil;
    if (shared==nil) {
        shared=[[self alloc] init];
    }
    return shared;
}

-(void)enter:(Warrior *)warrior {
}

-(void)execute:(Warrior *)warrior {
    warrior.diamonds=0;
    warrior.money=warrior.money+3000;
    NSLog(@"%@: I'm at the Gallery. I either won or I'm just starting.", warrior.name, warrior.money);
    
    if (warrior.money>5000)[warrior changeState:[Home shared]];
    else [warrior changeState:[Mine shared]];
}

-(void)exit:(Warrior *)warrior {
}

@end