//
//  facebook_godot_implementation.m
//  facebook-godot
//
//  Created by Aashutosh Shrestha on 12/18/23.
//

#import <Foundation/Foundation.h>
#include "core/object/class_db.h"
#include "core/object/object.h"
#include "facebook_godot_implementation.h"
FacebookGodot *FacebookGodot::instance = NULL;

FacebookGodot::FacebookGodot(){
        ERR_FAIL_COND(instance != NULL);
        instance = this;
}

FacebookGodot::~FacebookGodot(){
    if (instance == this) {
        instance = NULL;
       }
}
