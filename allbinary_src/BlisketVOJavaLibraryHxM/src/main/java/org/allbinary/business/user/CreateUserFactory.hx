/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2011 AllBinary
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
package org.allbinary.business.user;

//import java.util.HashMap;
import org.allbinary.business.user.role.UserRole;
import org.allbinary.business.user.role.UserRoleB;
import org.allbinary.business.user.role.UserRoleData;
import org.allbinary.logic.string.StringValidationUtil;

class CreateUserFactory {
    public function new() {
    }

    // throws Exception
    public static function getInstance(hashMap : HashMap) : UserInterface {
        if (hashMap != null) {
            var roleString : String = (cast hashMap.get(Std.string(UserRoleData.NAME)) : String);
            if (!StringValidationUtil.getInstance().isEmpty(roleString)) {
                var role : UserRole = UserRoleB.getRole(roleString);
                return role.getUserFactory().getInstance(hashMap);
            } else {
                throw new haxe.Exception("No Role Specified");
            }
        } else {
            throw new haxe.Exception("Null HashMap");
        }
    }

}

