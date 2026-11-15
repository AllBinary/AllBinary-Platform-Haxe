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
package org.allbinary.logic.java.bool;


class BooleanFactory {
    private static final instance : BooleanFactory = new BooleanFactory();
    public static function getInstance() : BooleanFactory {
        return BooleanFactory.instance;
    }

    public final TRUE : Null<Bool> = true;
    public final FALSE : Null<Bool> = false;
    public final TRUE_STRING : String;
    public final FALSE_STRING : String;
    public final YES : String = "yes";
    public final NO : String = "no";
    public function toStringb(bool : Bool) : String {
        if (bool) {
            return this.TRUE_STRING;
        } else {
            return this.FALSE_STRING;
        }
    }

    public function new() {
        this.TRUE_STRING = Std.string(this.TRUE);
        this.FALSE_STRING = Std.string(this.FALSE);
    }
}

