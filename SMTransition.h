//
//  SMTransition.h
//  FSM
//
//  Created by Xuhui on 14-3-23.
//  Copyright (c) 2014年 Xuhui. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SMState;
@class SMEvent;

@protocol SMTransitonProtocol <NSObject>

@required
@property (strong, nonatomic) SMState *sourceState;
@property (strong, nonatomic) SMState *targetState;

- (void)trigger:(SMEvent *)event;

@end

@interface SMBlockTransition : NSObject <SMTransitonProtocol>

@property (strong, nonatomic) SMState *sourceState;
@property (strong, nonatomic) SMState *targetState;

+ (instancetype)transitionWithsourceState:(SMState *)sourceState targetState:(SMState *)targetState action:(void (^)(SMEvent *))onTransition;

- (void)trigger:(SMEvent *)event;

@end

@interface SMFuntionTransition : NSObject <SMTransitonProtocol>

@property (strong, nonatomic) SMState *sourceState;
@property (strong, nonatomic) SMState *targetState;

+ (instancetype)transitionWithsourceState:(SMState *)sourceState targetState:(SMState *)targetState target:(id)target action:(SEL)selector;

- (void)trigger:(SMEvent *)event;
@end
