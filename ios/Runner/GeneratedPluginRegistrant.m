//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<amplify_analytics_pinpoint/AmplifyAnalyticsPinpointPlugin.h>)
#import <amplify_analytics_pinpoint/AmplifyAnalyticsPinpointPlugin.h>
#else
@import amplify_analytics_pinpoint;
#endif

#if __has_include(<amplify_auth_cognito/AuthCognito.h>)
#import <amplify_auth_cognito/AuthCognito.h>
#else
@import amplify_auth_cognito;
#endif

#if __has_include(<amplify_core/AmplifyCorePlugin.h>)
#import <amplify_core/AmplifyCorePlugin.h>
#else
@import amplify_core;
#endif

#if __has_include(<amplify_flutter/Amplify.h>)
#import <amplify_flutter/Amplify.h>
#else
@import amplify_flutter;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [AmplifyAnalyticsPinpointPlugin registerWithRegistrar:[registry registrarForPlugin:@"AmplifyAnalyticsPinpointPlugin"]];
  [AuthCognito registerWithRegistrar:[registry registrarForPlugin:@"AuthCognito"]];
  [AmplifyCorePlugin registerWithRegistrar:[registry registrarForPlugin:@"AmplifyCorePlugin"]];
  [Amplify registerWithRegistrar:[registry registrarForPlugin:@"Amplify"]];
}

@end
