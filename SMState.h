//
//  SMState.h
//  SMTransition
//
//  Created by Xuhui on 14-3-23.
//
//

#import <Foundation/Foundation.h>

@class SMStateMachine;
@class SMEvent;

@interface SMState : NSObject

@property (weak, nonatomic) SMStateMachine *stateMachine;
@property (readonly, nonatomic) SMState *parentState;
@property (readonly, nonatomic) NSString *stateName;


@property (copy, nonatomic) void (^onEntry)();
@property (copy, nonatomic) void (^onExit)();

+ (instancetype)stateWithName:(NSString *)stateName;

+ (instancetype)stateWithName:(NSString *)stateName parentState:(SMState *)parentState;

- (void)addTransitionWithEventType:(NSInteger)eventType targetState:(SMState *)targetState action:(void (^)(SMEvent *)) onTransition;

- (void)addTransitionWithEventType:(NSInteger)eventType targetState:(SMState *)targetState target:(id)target action:(SEL)selector;

- (void)triggerTransition:(SMEvent *)event;

@end
