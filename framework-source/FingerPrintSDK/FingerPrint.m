//
//  FingerPrint.m
//  FingerPrintSDK
//
//  Created by Jhonatan F. Ciriaco on 15/07/21.
//  Copyright © 2021 Jhonatan F. Ciriaco. All rights reserved.
//

#import "FingerPrint.h"
#import <TMXProfiling/TMXProfiling.h>
#import <TMXProfilingConnections/TMXProfilingConnections.h>


@implementation FingerPrint

TMXProfiling * _sdk;

+(void) startSDK:(bool)debug{
    if(_sdk){
        NSLog(@"SDK IS ALREADY INITIALIZED!");
        return;
    }
    
    _sdk = [TMXProfiling sharedInstance];
   
    
    @try{
        [_sdk configure:@{
            TMXOrgID: (debug) ? @"1snn5n9w" : @"",
        }];
        NSLog(@"SDK INITIALIZED!");
    } @catch(NSException *e){
        NSLog(@"Error is: %@", e.reason);
    }
}

+(NSString *) getSessionId:(bool)debug{
    __block NSString * sessionId;
    dispatch_queue_t aQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
    
    [self startSDK:debug];
    
    dispatch_sync(aQueue,^{
        while (![sessionId isEqual:[NSNull null]]) {
            [_sdk profileDeviceUsing:@{}
                      callbackBlock:^(NSDictionary * result) {
                
               sessionId = [result valueForKey:TMXSessionID];
            }];
        }
        [NSThread sleepForTimeInterval:1.5];
    });
    
    
    return sessionId;
}

@end
