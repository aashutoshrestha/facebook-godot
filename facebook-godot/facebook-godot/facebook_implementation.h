//
//  facebook_implementation.h
//  facebook-godot
//
//  Created by Aashutosh Shrestha on 12/19/23.
//

#ifndef facebook_implementation_h
#define facebook_implementation_hb
#include "core/object/object.h"
#include "facebook_godot.h"
#include "core/config/engine.h"
#include "core/io/json.h"


class FacebookGodot : public Object {
    GDCLASS(FacebookGodot, Object);
    
    FacebookGodot *instance;
    
    static void _bind_methods();
    
public:
    
//    void get_app_version();
   
    void login();
    
    FacebookGodot();
    ~FacebookGodot();
    
    static FacebookGodot *get_singleton();
};

#endif /* facebook_implementation_h */
