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
package org.allbinary.business.time;


class Time {
    private var timeLong : Null<haxe.Int64>;
    public function new(time : String) {
        this.timeLong = time;
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(time : haxe.Int64) {
        this.timeLong = time;
    }

    public function getLong() : Null<haxe.Int64> {
        return this.timeLong;
    }

    public function getlong() : haxe.Int64 {
        return haxe.Int64.ofInt(this.timeLong);
    }

    public function toString() : String {
        return Std.string(this.getLong());
    }

}

