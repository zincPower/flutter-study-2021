#import "TextviewFlutterPlugin.h"
#if __has_include(<textview_flutter/textview_flutter-Swift.h>)
#import <textview_flutter/textview_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "textview_flutter-Swift.h"
#endif

@implementation TextviewFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTextviewFlutterPlugin registerWithRegistrar:registrar];
}
@end
