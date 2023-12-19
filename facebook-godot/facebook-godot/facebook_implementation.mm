//
//  facebook_implementation.m
//  facebook-godot
//
//  Created by Aashutosh Shrestha on 12/19/23.
//

#import <Foundation/Foundation.h>
#import "facebook_godot.h"
#import "facebook_implementation.h"
#import <FBSDKLoginKit/FBSDKLoginKit-Swift.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
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
        ClassDB::bind_method("login", &FacebookGodot::login);
      
    NSLog(@"GodotShare Plugin: Binding Methods completed.");
}


void FacebookGodot::login(){
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logInWithPermissions:@[@"public_profile",@"email"] fromViewController:(ViewController *)((AppDelegate *)[[UIApplication sharedApplication] delegate]).window.rootViewController handler:^(FBSDKLoginManagerLoginResult * _Nullable result, NSError * _Nullable error) {
        if (error) {
                    NSLog(@"FB Login error %@",[error localizedDescription]);
                } else if (result.isCancelled) {
                    NSLog(@"Cancelled");
                } else {
                    if(result.token) {
                        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me"
                                                                           parameters:@{@"fields": @"picture, name, email"}]
                         startWithCompletion:^(id<FBSDKGraphRequestConnecting>  _Nullable connection, id  _Nullable userinfo, NSError * _Nullable error) {
                            NSLog(@"User Info %@", userinfo);
                        }];
                    }
                    NSLog(@"Logged in");
                    NSLog(@"FB Login result %@", result);
                }
    }];
}

FacebookGodot::FacebookGodot() {
}

FacebookGodot::~FacebookGodot() {
}
