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
package org.allbinary.logic.io;


class AbIOSystem {
    private static final instance : AbIOSystem = new AbIOSystem();
    public static function getInstance() : AbIOSystem {
        return AbIOSystem.instance;
    }

    private final type : String = "java.io";
    public function getType() : String {
        return this.type;
    }

    public function isType(type : String) : Bool {
        if (Reflect.compare(this.type, type) == 0) {
            return true;
        } else {
            return false;
        }
    }

    public function new() {
    }
}

