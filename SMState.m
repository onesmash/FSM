//
//  SMState.m
//  SMTransition
//
//  Created by Xuhui on 14-3-23.
//
//

#import "SMState.h"
#import "SMTransition.h"
#import "SMEvent.h"
#import "SMStateMachine.h"

@interface SMState () {
    NSMutableDictionary *_transitions;
    
}

@end

@implementation SMState

- (id)initWithName:(NSString *)stateName parentState:(SMState *)parentState {
    self = [super init];
    if(self) {
        _stateName = stateName;
        _parentState = parentState;
        _stateMachine = nil;
        _transitions = [NSMutableDictionary dictionary];
    }
    return  self;
}

- (void)addTransitionWithEventType:(NSInteger)eventType targetState:(SMState *)targetState action:(void (^)(SMEvent *)) onTransition {
    SMBlockTransition *transition = [SMBlockTransition transitionWithsourceState:self targetState:targetState action:onTransition];
    [_transitions setObject:transition forKey:[NSNumber numberWithInteger:eventType]];
}

- (void)addTransitionWithEventType:(NSInteger)eventType targetState:(SMState *)targetState target:(id)target action:(SEL)selector {
    SMFuntionTransition *transition = [SMFuntionTransition transitionWithsourceState:self targetState:targetState target:target action:selector];
    [_transitions setObject:transition forKey:[NSNumber numberWithInteger:eventType]];
}

+ (instancetype)stateWithName:(NSString *)stateName parentState:(SMState *)parentState {
    return [[SMState alloc] initWithName:stateName parentState:parentState];
}

+ (instancetype)stateWithName:(NSString *)stateName {
    return [[SMState alloc] initWithName:stateName parentState:nil];
}

- (void)triggerTransition:(SMEvent *)event {
    id<SMTransitonProtocol> transition = _transitions[[NSNumber numberWithInteger:event.eventType]];
    if(transition) {
        [transition trigger:event];
        _stateMachine.currentState = transition.targetState;
    } else {
        [_parentState triggerTransition:event];
    }
    
}



@end
