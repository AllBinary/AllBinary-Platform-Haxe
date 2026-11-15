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
package org.allbinary.graphics;

//import jsinterop.annotations.JsType;
//import jsinterop.annotations.JsMethod;
//import jsinterop.annotations.JsConstructor;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.math.PositionStrings;
import org.allbinary.string.CommonSeps;

class GPoint {
    public static function getInstance(point : GPoint) : GPoint {
        return new GPoint(point.getX(), point.getY(), point.getZ());
    }

    private final x : Int;
    private final y : Int;
    private final z : Int;
    public function new(x : Int, y : Int, z : Int) {
        this.x = x;
        this.y = y;
        this.z = z;
    }

    public function getX() : Int {
        return this.x;
    }

    public function getY() : Int {
        return this.y;
    }

    public function getZ() : Int {
        return this.z;
    }

    public function getRawX() : Int {
        return this.x;
    }

    public function getRawY() : Int {
        return this.y;
    }

    public function getRawZ() : Int {
        return this.z;
    }

    public function toString() : String {
        return GPoint.toStringStatic(this.getX(), this.getY(), this.getZ());
    }

    private static final POINT_LABEL : String = "Point: ";
    public static function toStringStatic(x : Int, y : Int, z : Int) : String {
        final stringBuffer : StringMaker = new StringMaker();
        final positionStrings : PositionStrings = PositionStrings.getInstance();
        stringBuffer.append(GPoint.POINT_LABEL);
        stringBuffer.append(positionStrings.X_LABEL);
        stringBuffer.appendint(x);
        stringBuffer.append(CommonSeps.getInstance().SPACE);
        stringBuffer.append(positionStrings.Y_LABEL);
        stringBuffer.appendint(y);
        stringBuffer.append(CommonSeps.getInstance().SPACE);
        stringBuffer.append(positionStrings.Z_LABEL);
        stringBuffer.appendint(z);
        return Std.string(stringBuffer);
    }

}

