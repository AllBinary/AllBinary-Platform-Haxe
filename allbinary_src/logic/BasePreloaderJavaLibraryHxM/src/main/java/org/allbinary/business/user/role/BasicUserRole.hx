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

import jre.io.Serializable;

class BasicUserRole implements Serializable {
    private final m_int_RoleId : Int;
    private final role : String;
    private final displayValue : String;
    private final sessionTimeout : haxe.Int64;
    private final sessionInactivityTimeout : haxe.Int64;
    public function new(...args : Dynamic) {
        if (args.length == 4) {
            final aRole : String = args[0];
            final a_int_RoleId : Int = args[1];
            final aSessionTimeout : haxe.Int64 = args[2];
            final aSessionInactivityTimeout : haxe.Int64 = args[3];
            {
                final aRole : String = aRole;
                final aDisplayValue : String = aRole;
                final a_int_RoleId : Int = a_int_RoleId;
                final aSessionTimeout : haxe.Int64 = aSessionTimeout;
                final aSessionInactivityTimeout : haxe.Int64 = aSessionInactivityTimeout;
            }
            this._new0(aRole, a_int_RoleId, aSessionTimeout, aSessionInactivityTimeout);
        }
        else if (args.length == 5) {
            final aRole : String = args[0];
            final aDisplayValue : String = args[1];
            final a_int_RoleId : Int = args[2];
            final aSessionTimeout : haxe.Int64 = args[3];
            final aSessionInactivityTimeout : haxe.Int64 = args[4];
            this._new1(aRole, aDisplayValue, a_int_RoleId, aSessionTimeout, aSessionInactivityTimeout);
        }
    }

    private function _new0(aRole : String, a_int_RoleId : Int, aSessionTimeout : haxe.Int64, aSessionInactivityTimeout : haxe.Int64) : Void {
        this._new1(aRole, aRole, a_int_RoleId, aSessionTimeout, aSessionInactivityTimeout);
    }

    private function _new1(aRole : String, aDisplayValue : String, a_int_RoleId : Int, aSessionTimeout : haxe.Int64, aSessionInactivityTimeout : haxe.Int64) : Void {
        this.m_int_RoleId = a_int_RoleId;
        this.role = aRole;
        this.displayValue = aDisplayValue;
        this.sessionTimeout = aSessionTimeout;
        this.sessionInactivityTimeout = aSessionInactivityTimeout;
        BasicUserRoles.getInstance().roleVector.add(this);
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

}

