/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2026 AllBinary 
 *  
 * By agreeing to this license you and any business entity you represent are 
 * legally bound to the AllBinary Open License Version 1 legal agreement. 
 *  
 * You may obtain the AllBinary Open License Version 1 legal agreement from 
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
 *  
 * Created By: Travis Berthelot 
 *   
 */
// Generated Code Do Not Modify
package org.allbinary.business.user.role;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class BasicUserRoles {
    private static final instance : BasicUserRoles = new BasicUserRoles();
    public static function getInstance() : BasicUserRoles {
        return BasicUserRoles.instance;
    }

    public final roleVector : BasicArrayList = new BasicArrayListD();
    // throws Exception
    public function getRole(role : String) : BasicUserRole {
        final roleVector : BasicArrayList = this.getAll();
        final size : Int = roleVector.size();
        for (index in 0...size) {
            var userRole : BasicUserRole = (cast roleVector.get(index) : BasicUserRole);
            if (Reflect.compare(role, Std.string(userRole)) == 0) {
                return userRole;
            }
        }
        throw new jre.lang.JavaException("Unable to get role - Unknown Role");
    }

    public function getAll() : BasicArrayList {
        return this.roleVector;
    }

    public function new() {
    }
}

