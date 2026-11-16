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
package org.allbinary.math;

//import jsinterop.annotations.JsType;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.logic.string.StringMaker;
//import jsinterop.annotations.JsProperty;
//import jsinterop.annotations.JsMethod;
//import jsinterop.annotations.JsConstructor;

class AngleIncrementInfo {
    private final angleIncrement : Int;
    public final DOWN_FRAME : Null<Int>;
    public final UP_FRAME : Null<Int>;
    public final LEFT_FRAME : Null<Int>;
    public final RIGHT_FRAME : Null<Int>;
    public function new(angleIncrement : Int) {
        this.angleIncrement = angleIncrement;
        final angleFactory : AngleFactory = AngleFactory.getInstance();
        final smallIntegerSingletonFactory : SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
        this.DOWN_FRAME = smallIntegerSingletonFactory.getAt(jre.lang.JavaNumber.divide(angleFactory.DOWN.getValue(), this.angleIncrement));
        this.UP_FRAME = smallIntegerSingletonFactory.getAt(jre.lang.JavaNumber.toInt(angleFactory.UP.getValue()));
        this.LEFT_FRAME = smallIntegerSingletonFactory.getAt(jre.lang.JavaNumber.divide(angleFactory.LEFT.getValue(), this.angleIncrement));
        this.RIGHT_FRAME = smallIntegerSingletonFactory.getAt(jre.lang.JavaNumber.divide(angleFactory.RIGHT.getValue(), this.angleIncrement));
    }

    private final frameUtil : FrameUtil = FrameUtil.getInstance();
    public function getFrameAngle(frame : Int) : Int {
        return this.frameUtil.getFrameAngle(frame, this.angleIncrement);
    }

    public function getAngleIncrement() : Int {
        return this.angleIncrement;
    }

    private static final INCREMENT : String = "Inc: ";
    public function toString() : String {
        return Std.string(new StringMaker().append(AngleIncrementInfo.INCREMENT).appendshort(this.angleIncrement));
    }

    public function getClosestGeneralDirection(angle : Int) : Int {
        var closestDirection : Null<Int> = SmallIntegerSingletonFactory.getInstance().getAt(360);
        if (jre.lang.JavaNumber.toInt(this.UP_FRAME) - angle < jre.lang.JavaNumber.toInt(closestDirection) - angle) {
            closestDirection = this.UP_FRAME;
        }
        if (jre.lang.JavaNumber.toInt(this.DOWN_FRAME) - angle < jre.lang.JavaNumber.toInt(closestDirection) - angle) {
            closestDirection = this.DOWN_FRAME;
        }
        if (jre.lang.JavaNumber.toInt(this.LEFT_FRAME) - angle < jre.lang.JavaNumber.toInt(closestDirection) - angle) {
            closestDirection = this.LEFT_FRAME;
        }
        if (jre.lang.JavaNumber.toInt(this.RIGHT_FRAME) - angle < jre.lang.JavaNumber.toInt(closestDirection) - angle) {
            closestDirection = this.RIGHT_FRAME;
        }
        return jre.lang.JavaNumber.toInt(closestDirection);
    }

}

