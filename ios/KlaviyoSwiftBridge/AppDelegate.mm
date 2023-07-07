#import "AppDelegate.h"
#import "KlaviyoSwiftBridge-Bridging-Header.h"
#import "RNCConfig.h"
#import <React/RCTBundleURLProvider.h>

#import "KlaviyoSwiftBridge-Swift.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.moduleName = @"KlaviyoSwiftBridge";
  // You can add your custom initial props in the dictionary below.
  // They will be passed down to the ViewController used by React Native.
  self.initialProps = @{};
  
  // Create an instance of KlaviyoSDKBridge and call initialize on it.
  //NSString *apiKey = [RNCConfig envFor:@"KLAVIYO_API_KEY"];
  //NSLog(@"%@", apiKey);
  //KlaviyoSDKBridge *klaviyoBridge = [[KlaviyoSDKBridge alloc] init];
  //[klaviyoBridge initializeWithApiKey:apiKey];

  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

@end
