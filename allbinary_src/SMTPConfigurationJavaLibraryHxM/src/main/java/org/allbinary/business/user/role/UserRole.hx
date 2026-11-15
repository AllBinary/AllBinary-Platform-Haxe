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

//import java.io.Serializable;
import org.allbinary.business.user.UserFactoryInterface;

class UserRole implements Serializable {
    private var basicUserRole : BasicUserRole;
    private var userFactoryInterface : UserFactoryInterface;
    public function new(aBasicUserRole : BasicUserRole, aUserFactoryInterface : UserFactoryInterface) {
        this.basicUserRole = aBasicUserRole;
        this.userFactoryInterface = aUserFactoryInterface;
    }

    public function toString() : String {
        return this.basicUserRole.toString();
    }

    public function getBasicUserRole() : BasicUserRole {
        return this.basicUserRole;
    }

    // throws Exception
    public function getUserFactory() : UserFactoryInterface {
        return this.userFactoryInterface;
    }

    public function getSessionTimeout() : haxe.Int64 {
        return this.basicUserRole.getSessionTimeout();
    }

    public function getSessionInactivityTimeout() : haxe.Int64 {
        return this.basicUserRole.getSessionInactivityTimeout();
    }

}

