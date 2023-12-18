//
//  facebook_godot_implementation.h
//  facebook-godot
//
//  Created by Aashutosh Shrestha on 12/18/23.
//
#import <Foundation/Foundation.h>
#include "core/object/class_db.h"
#include "core/engine.h"
class FacebookGodot : public Object {
    GDCLASS(FacebookGodot, Object);
          
    
           static FacebookGodot *instance;
    
            static void _bind_methods();
    
public:
    
//    void get_app_version();
    void init();
    
    FacebookGodot();
    ~FacebookGodot();
    
    static GoogleAdmob *get_singleton();
    
private:
       const char* getDeviceId();
};



