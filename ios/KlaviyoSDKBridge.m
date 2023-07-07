//
//  KlaviyoSDKBridge.m
//  KlaviyoSwiftBridge
//
//  Created by Michael Svendsen on 2023-07-06.
//

#import <Foundation/Foundation.h>
#import "React/RCTBridgeModule.h"

@interface RCT_EXTERN_MODULE(KlaviyoSDKBridge, NSObject)
RCT_EXTERN_METHOD(initialize: (String)apiKey)
@end
