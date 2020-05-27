#import "RpdPlugin.h"
#if __has_include(<rpd_plugin/rpd_plugin-Swift.h>)
#import <rpd_plugin/rpd_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "rpd_plugin-Swift.h"
#endif

@implementation RpdPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftRpdPlugin registerWithRegistrar:registrar];
}
@end
