//
//  facebook_implementation.m
//  facebook-godot
//
//  Created by Aashutosh Shrestha on 12/19/23.
//

#import <Foundation/Foundation.h>
#import "facebook_godot.h"
#import "facebook_implementation.h"
#if VERSION_MAJOR == 4
#import "platform/ios/app_delegate.h"
#import "platform/ios/view_controller.h"
#else
#import "platform/iphone/app_delegate.h"
#import "platform/iphone/view_controller.h"
#endif
#include "platform/iphone/platform_config.h"
String from_nsstring(NSString* str) {
    const char *s = [str UTF8String];
    return String::utf8(s != NULL ? s : "");
}
NSString* to_nsstring(String str) {
    return [[NSString alloc] initWithUTF8String:str.utf8().get_data()];
}

void FacebookGodot::_bind_methods() {
    NSLog(@"GodotShare Plugin: Binding Methods...");
        ClassDB::bind_method("shareText", &FacebookGodot::shareText);
        ClassDB::bind_method("sharePic", &FacebookGodot::sharePic);
    NSLog(@"GodotShare Plugin: Binding Methods completed.");
}


void FacebookGodot::shareText(const String &title, const String &subject, const String &text) {
    
}

void FacebookGodot::sharePic(const String &path, const String &title, const String &subject, const String &text) {
   
}
FacebookGodot::FacebookGodot() {
}

FacebookGodot::~FacebookGodot() {
}
