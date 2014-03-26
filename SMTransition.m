//
//  SMTransition.m
//  FSM
//
//  Created by Xuhui on 14-3-23.
//  Copyright (c) 2014年 Xuhui. All rights reserved.
//

#import "SMTransition.h"
#import "SMEvent.h"
#import "SMState.h"

@interface SMBlockTransition ()

@property (copy, nonatomic) void (^onTransition)(SMEvent *);

@end

@implementation SMBlockTransition

- (id)initWithSourceState:(SMState *)sourceState targetState:(SMState *)targetState action:(void (^)(SMEvent *))onTransition {
    self = [super init];
    if(self) {
        _sourceState = sourceState;
        _targetState = targetState;
        _onTransition = onTransition;
    }
    return  self;
}

+ (instancetype)transitionWithsourceState:(SMState *)sourceState targetState:(SMState *)targetState action:(void (^)(SMEvent *))onTransition {
    return [[SMBlockTransition alloc] initWithSourceState:sourceState targetState:targetState action:onTransition];
}

- (void)trigger:(SMEvent *)event {
    _onTransition(event);
}

@end

@interface SMFuntionTransition ()

@property (weak, nonatomic) id target;
@property (assign, nonatomic) SEL selector;

@end

@implementation SMFuntionTransition

- (id)initWithSourceState:(SMState *)sourceState targetState:(SMState *)targetState target:(id)target action:(SEL)selector {
    self = [super init];
    if(self) {
        _sourceState = sourceState;
        _targetState = targetState;
        _target = target;
        _selector = selector;
    }
    return  self;
}

+ (instancetype)transitionWithsourceState:(SMState *)sourceState targetState:(SMState *)targetState target:(id)target action:(SEL)selector {
    return [[SMFuntionTransition alloc] initWithSourceState:sourceState targetState:targetState target:target action:selector];
}

- (void)trigger:(SMEvent *)event {
    if(_selector) {
      [_target performSelector:_selector withObject:event];
    }
}

@end
