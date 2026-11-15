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
package org.allbinary.business.user.role;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.user.UserFactoryInterface;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.string.StringValidationUtil;

class UserRoleB extends UserRole {
    public static var roleVector : BasicArrayList = new BasicArrayListD();
    public function new(aBasicUserRole : BasicUserRole, aUserFactoryInterface : UserFactoryInterface) {
        super(aBasicUserRole, aUserFactoryInterface);
        UserRoleB.roleVector.add(this);
    }

    // throws Exception
    // synchronized
    public static function getRole(role : String) : UserRole {
        UserRoleFactory.getInstance();
        if (!StringValidationUtil.getInstance().isEmpty(role)) {
            final roleVector : BasicArrayList = UserRoleB.getAll();
            final size : Int = roleVector.size();
            for (index in 0...size) {
                var userRole : UserRole = (cast roleVector.get(index) : UserRole);
                if (Reflect.compare(role, Std.string(userRole)) == 0) {
                    return userRole;
                }
            }
        }
        throw new haxe.Exception("Unable to get role - Unknown Role = " + role);
    }

    public static function getAll() : BasicArrayList {
        UserRoleFactory.getInstance();
        return UserRoleB.roleVector;
    }

}

