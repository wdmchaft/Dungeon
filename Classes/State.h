#import "cocos2d.h"
@class Warrior;

@interface State : NSObject {
}

-(void)enter:(Warrior *)warrior;
-(void)execute:(Warrior *)warrior;
-(void)exit:(Warrior *)warrior;
@end
