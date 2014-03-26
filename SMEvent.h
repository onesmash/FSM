//
//  SMEvent.h
//  FSM
//
//  Created by Xuhui on 14-3-23.
//  Copyright (c) 2014年 Xuhui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMEvent : NSObject 
@property (assign, nonatomic) NSInteger eventType;
@property (strong, nonatomic) NSDictionary *usrData;

+ (instancetype)eventWith:(NSInteger)type usrData:(NSDictionary *)usrdata;

@end
