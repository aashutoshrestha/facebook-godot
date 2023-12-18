//
//  facebook_godot.m
//  facebook-godot
//
//  Created by Aashutosh Shrestha on 12/18/23.
//

#import "facebook_godot.h"
FacebookGodot *facebook;

void facebook_init() {
    NSLog(@"facebook init plugin");

    admob = memnew(facebook);
    Engine::get_singleton()->add_singleton(Engine::Singleton("facebook", admob));
    
}

void facebook_deinit() {
    NSLog(@"facebook deinit plugin");
    
    if (facebook && facebook != nullptr) {
       memdelete(facebook);
   }
    NSLog(@"facebook deinit plugin succesful");
    sleep(10);
}
