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
package org.allbinary.logic.math;

import org.allbinary.logic.string.StringMaker;

class Orientation {
    public static var NONE : Orientation = new Orientation(0, 0, 0);
    private static var SINGLETON : Orientation = new Orientation(0, 0, 0);
    public var yaw : BasicDecimal = new BasicDecimal(0);
    public var pitch : BasicDecimal = new BasicDecimal(0);
    public var roll : BasicDecimal = new BasicDecimal(0);
    public static function getInstance(yaw : Int, pitch : Int, roll : Int) : Orientation {
        Orientation.SINGLETON.yaw.setint(yaw);
        Orientation.SINGLETON.pitch.setint(pitch);
        Orientation.SINGLETON.roll.setint(roll);
        return Orientation.SINGLETON;
    }

    public function new(yaw : Int, pitch : Int, roll : Int) {
        this.yaw.setint(yaw);
        this.pitch.setint(pitch);
        this.roll.setint(roll);
    }

    public function toString() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("Y: ");
        stringBuffer.append(this.yaw.toString());
        stringBuffer.append(" P: ");
        stringBuffer.append(this.pitch.toString());
        stringBuffer.append(" R: ");
        stringBuffer.append(this.roll.toString());
        return stringBuffer.toString();
    }

}

