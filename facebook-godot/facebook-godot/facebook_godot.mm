//
//  facebook_godot.m
//  facebook-godot
//
//  Created by Aashutosh Shrestha on 12/19/23.
//

#import <Foundation/Foundation.h>
#import "facebook_godot.h"
#import "facebook_implementation.h"
#import "core/engine.h"


FacebookGodot *godotFacebook;

void godot_facebook_init() {
    godotFacebook = memnew(FacebookGodot);
    Engine::get_singleton()->add_singleton(Engine::Singleton("FacebookGodot", godotFacebook));
}

void godot_facebook_deinit() {
    if (godotFacebook) {
       memdelete(godotFacebook);
   }
}
