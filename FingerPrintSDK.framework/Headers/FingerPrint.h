//
//  NewModule.h
//  TestFingerprint
//
//  Created by Jhonatan F. Ciriaco on 14/07/21.
//  Copyright © 2021 Jhonatan F. Ciriaco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FingerPrint : NSObject

+(void) startSDK: (bool)debug;
+(NSString *) getSessionId:(bool)debug;

@end
