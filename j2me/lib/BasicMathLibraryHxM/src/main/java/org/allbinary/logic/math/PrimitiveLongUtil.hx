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

import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class PrimitiveLongUtil {
    public static function createPowerOfTen(powerOfTen : Int) : PrimitiveLongUtil {
        final primitiveLongUtil : PrimitiveLongUtil = new PrimitiveLongUtil(powerOfTen, NullUtil.getInstance().NULL_OBJECT);
        if (powerOfTen % 10 != 0) {
            final logUtil : LogUtil = LogUtil.getInstance();
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            logUtil.put(commonStrings.EXCEPTION, primitiveLongUtil, commonStrings.CONSTRUCTOR, new haxe.Exception("Max must be power of 10"));
        }
        return primitiveLongUtil;
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    private var powerOfTen : Int;
    private var maxValue : Int;
    private var maxDigits : Int;
    private final charArray : haxe.ds.Vector<Int>;
    private var currentTotalDigits : Int = 0;
    private final primitiveLongSingleton : PrimitiveLongSingleton = PrimitiveLongSingleton.getInstance();
    public function new(powerOfTen : Int, unused : Any) {
        this.maxDigits = MathUtil.getInstance().getTotalDigits(powerOfTen);
        this.powerOfTen = powerOfTen;
        this.maxValue = (powerOfTen * 10) - 1;
        this.charArray = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.maxDigits) 0]);
    }

    public function getCharArray(value : Int) : haxe.ds.Vector<Int> {
        if (value < 10) {
            this.setCurrentTotalDigits(1);
            return this.primitiveLongSingleton.NUMBER_CHAR_ARRAYS[value];
        }
        if (value > this.maxValue) {
            this.setCurrentTotalDigits(3);
            return this.primitiveLongSingleton.UNK;
        }
        var index : Int = 0;
        var div : Int = this.powerOfTen;
        var lastValue : Int = 0;
        while (div >= 1) {
            var digit : Int = Std.int((value - lastValue) / div);
            if (digit >= 0 && digit < 10) {
                if (digit == 0 && index == 0) {
                } else {
                    this.charArray[index++] = this.primitiveLongSingleton.NUMBER_CHAR_ARRAY[digit];
                }
                lastValue += digit * div;
            }
            div = Std.int(div / 10);
        }
        this.setCurrentTotalDigits(index);
        return this.charArray;
    }

    private function setCurrentTotalDigits(currentTotalDigits : Int) : Void {
        this.currentTotalDigits = currentTotalDigits;
    }

    public function getCurrentTotalDigits() : Int {
        return this.currentTotalDigits;
    }

    public function getMaxDigits() : Int {
        return this.maxDigits;
    }

}

