//
//  facebook_godot.m
//  facebook-godot
//
//  Created by Aashutosh Shrestha on 12/19/23.
//

#import <Foundation/Foundation.h>
#import "facebook_godot.h"
#import "facebook_godot_implementation.h"
#import "core/engine.h"


GodotFacebook *godotFacebook;

void godot_facebook_init() {
    godotFacebook = memnew(godotFacebook);
    Engine::get_singleton()->add_singleton(Engine::Singleton("GodotFacebook", godotFacebook));
    
}

void godot_facebook_deinit() {
   
    
    if (godotShare) {
       memdelete(godotShare);
       
   }
}
