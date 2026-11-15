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
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonSeps;
import jsinterop.annotations.JsMethod;
import jsinterop.annotations.JsConstructor;

class AngleInfo {
    private final angleIncrementInfo : AngleIncrementInfo;
    private var angle : Int = 0;
    public static function getInstance(angleIncrement : Int) : AngleInfo {
        return new AngleInfo(AngleIncrementInfoFactory.getInstance().getAt(angleIncrement));
    }

    public function new(angleIncrementInfo : AngleIncrementInfo) {
        this.angleIncrementInfo = angleIncrementInfo;
    }

    private final frameUtil : FrameUtil = FrameUtil.getInstance();
    public function adjustAngle(frame : Int) : Void {
        final newAngle : Int = this.angleIncrementInfo.getAngleIncrement() * frame - 90;
        this.setAngle(Std.int(this.frameUtil.adjustAngleToFrameAngle(newAngle)));
    }

    public function getAngle() : Int {
        return this.angle;
    }

    public function setAngle(angle : Int) : Void {
        this.angle = angle;
    }

    public function getAngleIncrementInfo() : AngleIncrementInfo {
        return this.angleIncrementInfo;
    }

    private static final ANGLE : String = "Angle: ";
    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(AngleInfo.ANGLE);
        stringBuffer.appendshort(this.angle);
        stringBuffer.append(CommonSeps.getInstance().SPACE);
        stringBuffer.append(StringUtil.getInstance().toString(this.getAngleIncrementInfo()));
        return stringBuffer.toString();
    }

}

