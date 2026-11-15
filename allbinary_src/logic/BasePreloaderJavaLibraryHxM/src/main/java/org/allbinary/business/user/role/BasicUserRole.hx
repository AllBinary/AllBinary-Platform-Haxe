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
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class BasicUserRole implements Serializable {
    private static final roleVector : BasicArrayList = new BasicArrayListD();
    private final m_int_RoleId : Int;
    private final role : String;
    private final displayValue : String;
    private final sessionTimeout : haxe.Int64;
    private final sessionInactivityTimeout : haxe.Int64;
    public function new(aRole : String, a_int_RoleId : Int, aSessionTimeout : haxe.Int64, aSessionInactivityTimeout : haxe.Int64) {
        // this(aRole, aRole, a_int_RoleId, aSessionTimeout, aSessionInactivityTimeout) - Haxe has one constructor
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(aRole : String, aDisplayValue : String, a_int_RoleId : Int, aSessionTimeout : haxe.Int64, aSessionInactivityTimeout : haxe.Int64) {
        this.m_int_RoleId = a_int_RoleId;
        this.role = aRole;
        this.displayValue = aDisplayValue;
        this.sessionTimeout = aSessionTimeout;
        this.sessionInactivityTimeout = aSessionInactivityTimeout;
        BasicUserRole.roleVector.add(this);
    }

    private function getRoleId() : Int {
        return this.m_int_RoleId;
    }

    public function getRole() : String {
        return this.role;
    }

    public function getSessionTimeout() : haxe.Int64 {
        return this.sessionTimeout;
    }

    public function getSessionInactivityTimeout() : haxe.Int64 {
        return this.sessionInactivityTimeout;
    }

    public function equals(basicUserRole : BasicUserRole) : Bool {
        if (this.getRoleId() == basicUserRole.getRoleId()) {
            return true;
        }
        return false;
    }

    public function toString() : String {
        return this.getRole();
    }

    // throws Exception
    // synchronized
    public static function getRole(role : String) : BasicUserRole {
        final roleVector : BasicArrayList = BasicUserRole.getAll();
        final size : Int = roleVector.size();
        for (index in 0...size) {
            var userRole : BasicUserRole = (cast roleVector.get(index) : BasicUserRole);
            if (Reflect.compare(role, userRole.toString()) == 0) {
                return userRole;
            }
        }
        throw new haxe.Exception("Unable to get role - Unknown Role");
    }

    public static function getAll() : BasicArrayList {
        return BasicUserRole.roleVector;
    }

}

