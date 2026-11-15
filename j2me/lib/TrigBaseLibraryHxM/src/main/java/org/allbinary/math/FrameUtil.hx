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

import jsinterop.annotations.JsType;
import jsinterop.annotations.JsMethod;
import jsinterop.annotations.JsConstructor;

class FrameUtil {
    private static final instance : FrameUtil = new FrameUtil();
    public static function getInstance() : FrameUtil {
        return FrameUtil.instance;
    }

    public function new() {
    }

    public function getFrameForAngle(angle : Int, angleIncrement : Int) : Int {
        return Std.int(this.adjustAngleToFrameAngle(angle) / angleIncrement);
    }

    public function getFrameAngle(frame : Int, angleIncrement : Int) : Int {
        final frameAngle : Int = angleIncrement * frame - 90;
        return this.adjustAngleToFrameAngle(frameAngle);
    }

    public function adjustAngleToFrameAngle(currentAngle : Int) : Int {
        final angleFactory : AngleFactory = AngleFactory.getInstance();
        if (currentAngle > 359) {
            currentAngle = (currentAngle - angleFactory.TOTAL_ANGLE);
            while (currentAngle > 359) {
                currentAngle = (currentAngle - angleFactory.TOTAL_ANGLE);
            }
        }
        if (currentAngle < 0) {
            currentAngle = (currentAngle + angleFactory.TOTAL_ANGLE);
            while (currentAngle < 0) {
                currentAngle = (currentAngle + angleFactory.TOTAL_ANGLE);
            }
        }
        return currentAngle;
    }

}

