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
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonPhoneStrings;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import jsinterop.annotations.JsMethod;
import jsinterop.annotations.JsConstructor;
import jsinterop.annotations.JsProperty;

class AngleFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : AngleFactory = new AngleFactory();
    public static function getInstance() : AngleFactory {
        return AngleFactory.instance;
    }

    public final TOTAL_ANGLE : Int = 360;
    public final QUARTER_TOTAL_ANGLE : Int = 90;
    private final angleArray : haxe.ds.Vector<Angle> = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.TOTAL_ANGLE) null]);
    private final NEGATIVE_ONE : Int = -1;
    public final NOT_ANGLE : NamedAngle = new NamedAngle(this.NEGATIVE_ONE, CommonStrings.getInstance().EMPTY);
    public final DOWN : NamedAngle;
    public final UP : NamedAngle;
    public final LEFT : NamedAngle;
    public final RIGHT : NamedAngle;
    public function new() {
        final commonPhoneStrings : CommonPhoneStrings = CommonPhoneStrings.getInstance();
        final total : Int = this.angleArray.length;
        this.UP = new NamedAngle(0, commonPhoneStrings.UP);
        this.angleArray[0] = this.UP;
        for (index in 1...90) {
            this.angleArray[index] = new Angle(index);
        }
        this.RIGHT = new NamedAngle(90, commonPhoneStrings.RIGHT);
        this.angleArray[90] = this.RIGHT;
        for (index in 91...180) {
            this.angleArray[index] = new Angle(index);
        }
        this.DOWN = new NamedAngle(180, commonPhoneStrings.DOWN);
        this.angleArray[180] = this.DOWN;
        for (index in 181...270) {
            this.angleArray[index] = new Angle(index);
        }
        this.LEFT = new NamedAngle(270, commonPhoneStrings.LEFT);
        this.angleArray[270] = this.LEFT;
        for (index in 271...total) {
            this.angleArray[index] = new Angle(index);
        }
    }

    private final frameUtil : FrameUtil = FrameUtil.getInstance();
    public function getAt(index : Int) : Angle {
        final adjustedIndex : Int = Std.int(this.frameUtil.adjustAngleToFrameAngle(index));
        return this.angleArray[adjustedIndex];
    }

    public function getClosestDirection(angle : Int) : Angle {
        if ((angle >= 315 && angle < 360) || (angle >= 0 && angle < 45)) {
            return this.UP;
        } else if (angle >= 45 && angle < 135) {
            return this.RIGHT;
        } else if (angle >= 135 && angle < 225) {
            return this.DOWN;
        } else if (angle >= 225 && angle < 315) {
            return this.LEFT;
        }
        throw new haxe.Exception();
    }

    public function getGeneralDirection() : Angle {
        return this.NOT_ANGLE;
    }

    public static function main(args : haxe.ds.Vector<String>) : Void {
        final stringMaker : StringMaker = new StringMaker();
        final angleFactory : AngleFactory = AngleFactory.getInstance();
        for (index in 0...360) {
            stringMaker.appendint(index).append(CommonSeps.getInstance().FORWARD_SLASH).appendshort(Std.int(angleFactory.getClosestDirection(index).getValue())).append(CommonSeps.getInstance().NEW_LINE);
        }
        LogUtil.getInstance().putF(stringMaker.toString(), "main", "main");
    }

}

