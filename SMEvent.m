//
//  SMEvent.m
//  FSM
//
//  Created by Xuhui on 14-3-23.
//  Copyright (c) 2014年 Xuhui. All rights reserved.
//

#import "SMEvent.h"

@implementation SMEvent

- (id)initWithEvnetType:(NSInteger)type usrData:(NSDictionary *)usrData {
    self = [super init];
    if(self) {
        _eventType = type;
        _usrData = usrData;
    }
    return self;
}

+ (instancetype)eventWith:(NSInteger)type usrData:(NSDictionary *)usrdata {
    return [[SMEvent alloc] initWithEvnetType:type usrData:usrdata];
}

@end
