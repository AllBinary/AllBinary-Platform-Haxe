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
package org.allbinary.time;


class NoTimeDelayHelper extends TimeDelayHelper {
    public static final SINGLETON : NoTimeDelayHelper = new NoTimeDelayHelper();
    public function new() {
        super(0);
    }

    public override function isTimeTNT() : Bool {
        return true;
    }

    public override function isTimeSinceTNT(delay : Int) : Bool {
        return true;
    }

    public override function isTime(currentTime : haxe.Int64) : Bool {
        return true;
    }

    public override function isTimeSince(delay : Int, currentTime : haxe.Int64) : Bool {
        return true;
    }

}

