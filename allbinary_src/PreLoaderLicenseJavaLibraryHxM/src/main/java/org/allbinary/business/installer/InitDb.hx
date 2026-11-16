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
package org.allbinary.business.installer;

//import java.lang.reflect.Method;
import org.allbinary.business.init.db.DbConnectionInfo;
import org.allbinary.logic.system.security.licensing.LicensingException;

//Warning you must have sql root access
class InitDb {
    private var anyType : Any = null;
    private var METHOD_CALL_GET_HOST_NAME : String = "getHostName";
    private var METHOD_CALL_ADD_USERS : String = "addUsers";
    private var METHOD_CALL_ADD_DATABASES : String = "addDatabases";
    private var METHOD_CALL_ADD_TABLES : String = "addTables";
    private var METHOD_CALL_TEMP_MAIN_PATH : String = "useTemporaryMainPath";
    private var METHOD_CALL_MAIN_PATH : String = "useNormalMainPath";
    public function new(...args : Dynamic) {
        if (args.length == 0) {
            this._newInitDb0();
        }
        else if (args.length == 1) {
            final dbConnectionInfo : DbConnectionInfo = args[0];
            this._newInitDb1(dbConnectionInfo);
        }
    }

    private function _newInitDb0() : Void {
    }

    private function _newInitDb1(dbConnectionInfo : DbConnectionInfo) : Void {
    }

    public function setHelper(anyType : Any) : Void {
        this.anyType = anyType;
    }

    public function getHelper() : Any {
        return this.anyType;
    }

    private function getHostName() : String {
        try {
            var dynamicClass : Class<Dynamic> = Type.getClass(this.anyType);
            var method : Method = dynamicClass.getMethod(this.METHOD_CALL_GET_HOST_NAME, null);
            var result : String = (cast method.invoke(this.anyType, null) : String);
            return result;
        } catch (e : haxe.Exception) {
            return null;
        }
    }

    public function addUsers() : Bool {
        try {
            var dynamicClass : Class<Dynamic> = Type.getClass(this.anyType);
            var method : Method = dynamicClass.getMethod(this.METHOD_CALL_ADD_USERS, null);
            var result : Null<Bool> = (cast method.invoke(this.anyType, null) : Null<Bool>);
            return result.booleanValue();
        } catch (e : haxe.Exception) {
            return false;
        }
    }

    public function addDatabases() : Bool {
        try {
            var dynamicClass : Class<Dynamic> = Type.getClass(this.anyType);
            var method : Method = dynamicClass.getMethod(this.METHOD_CALL_ADD_DATABASES, null);
            var result : Null<Bool> = (cast method.invoke(this.anyType, null) : Null<Bool>);
            return result.booleanValue();
        } catch (e : haxe.Exception) {
            return false;
        }
    }

    public function addTables() : Bool {
        try {
            var dynamicClass : Class<Dynamic> = Type.getClass(this.anyType);
            var method : Method = dynamicClass.getMethod(this.METHOD_CALL_ADD_TABLES, null);
            var result : Null<Bool> = (cast method.invoke(this.anyType, null) : Null<Bool>);
            return result.booleanValue();
        } catch (e : haxe.Exception) {
            return false;
        }
    }

    public function useTemporaryMainPath() : Bool {
        try {
            var dynamicClass : Class<Dynamic> = Type.getClass(this.anyType);
            var method : Method = dynamicClass.getMethod(this.METHOD_CALL_TEMP_MAIN_PATH, null);
            var result : Null<Bool> = (cast method.invoke(this.anyType, null) : Null<Bool>);
            return result.booleanValue();
        } catch (e : haxe.Exception) {
            return false;
        }
    }

    public function useNormalMainPath() : Bool {
        try {
            var dynamicClass : Class<Dynamic> = Type.getClass(this.anyType);
            var method : Method = dynamicClass.getMethod(this.METHOD_CALL_MAIN_PATH, null);
            var result : Null<Bool> = (cast method.invoke(this.anyType, null) : Null<Bool>);
            return result.booleanValue();
        } catch (e : haxe.Exception) {
            return false;
        }
    }

}

