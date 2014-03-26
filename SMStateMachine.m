//
//  SMStateMachine.m
//  SMTransition
//
//  Created by Xuhui on 14-3-23.
//
//

#import "SMStateMachine.h"
#import "SMState.h"

@interface SMStateMachine () {
    NSMutableDictionary *_states;
    BOOL _running;
}

@end

@implementation SMStateMachine

- (id)initWithInitialState:(SMState *)state {
    self = [super init];
    if(self) {
        _initialState = state;
        if(_initialState != nil) {
            [self addState:_initialState];
        }
    }
    return self;
}

@synthesize  running = _running;

- (id)init {
    self = [super init];
    if(self) {
        _states = [NSMutableDictionary dictionary];
        _running = NO;
    }
    return self;
}

- (void)addState:(SMState *)state {
    [_states setObject:state forKey:state.stateName];
    state.stateMachine = self;
}

- (void)removeState:(SMState *)state {
    [_states removeObjectForKey:state.stateName];
    state.stateMachine = nil;
}

- (void)start {
    _running = YES;
    self.currentState = _initialState;
}

- (void)stop {
    _running = NO;
}

- (BOOL)isRunning {
    return _running;
}

- (void)setCurrentState:(SMState *)state {
    if(_currentState) {
        if(_currentState.onExit) {
            _currentState.onExit();
        }
    }
    if(state.onEntry) {
        state.onEntry();
    }
    _currentState = state;
}

- (void)postEvent:(SMEvent *)event {
    [_currentState triggerTransition:event];
}

@end

@implementation SMDirectChangeStateMachine

- (void)transferStateTo:(SMState *)state {
    self.currentState = state;
}

@end
