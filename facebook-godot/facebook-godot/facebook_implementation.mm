//
//  facebook_implementation.m
//  facebook-godot
//
//  Created by Aashutosh Shrestha on 12/19/23.
//

#import <Foundation/Foundation.h>
#import "facebook_godot.h"
#import "facebook_implementation.h"
#import <AuthenticationServices/AuthenticationServices.h>
#import <SafariServices/SafariServices.h>
#import <FBSDKLoginKit/FBSDKLoginKit-Swift.h>
#import <FBSDKCoreKit/FBSDKCoreKit-Swift.h>
#import "platform/ios/app_delegate.h"
#import "platform/ios/view_controller.h"
#include "platform/ios/platform_config.h"
String from_nsstring(NSString* str) {
    const char *s = [str UTF8String];
    return String::utf8(s != NULL ? s : "");
}
NSString* to_nsstring(String str) {
    return [[NSString alloc] initWithUTF8String:str.utf8().get_data()];
}

void FacebookGodot::_bind_methods() {
    NSLog(@"GodotShare Plugin: Binding Methods...");
        ClassDB::bind_method("initialize", &FacebookGodot::initialize);
        ClassDB::bind_method("login", &FacebookGodot::login);
    
    ADD_SIGNAL(MethodInfo(SIGNAL_LOGIN_SUCCESS, PropertyInfo(Variant::DICTIONARY, "result")));
    ADD_SIGNAL(MethodInfo(SIGNAL_LOGIN_ERROR, PropertyInfo(Variant::DICTIONARY, "result")));
      
    NSLog(@"GodotShare Plugin: Binding Methods completed.");
}

void FacebookGodot::initialize(){
    UIApplication *application = [UIApplication sharedApplication];
    
    [FBSDKApplicationDelegate.sharedInstance application:application didFinishLaunchingWithOptions:[NSMutableDictionary dictionary]];
    [[FBSDKApplicationDelegate sharedInstance] application:application
                                           openURL:[NSURL URLWithString:@""]
                                 sourceApplication:@""
                                                   annotation:@""];
    [FBSDKApplicationDelegate initialize];
//
    

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
//                            Variant godot_result = Variant();
//                            
//                            if (result) {
//                                String errs;
//                                int errl;
//                                
//                                JSON::parse(*(new String(result)), godot_result, errs, errl);
//                            }
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
