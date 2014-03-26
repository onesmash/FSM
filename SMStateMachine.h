//
//  SMStateMachine.h
//  SMTransition
//
//  Created by Xuhui on 14-3-23.
//
//

#import <Foundation/Foundation.h>
#import "SMState.h"
#import "SMEvent.h"

@interface SMStateMachine : NSObject

@property (strong, nonatomic) SMState *initialState;
@property (strong, nonatomic) SMState *currentState;
@property (readonly, nonatomic, getter = isRunning) BOOL running;

- initWithInitialState:(SMState *)state;

- (void)addState:(SMState *)state;
- (void)removeState:(SMState *)state;
- (void)postEvent:(SMEvent *)event;
- (void)start;
- (void)stop;

@end

@interface SMDirectChangeStateMachine : SMStateMachine

- (void)transferStateTo:(SMState *)state;

@end
