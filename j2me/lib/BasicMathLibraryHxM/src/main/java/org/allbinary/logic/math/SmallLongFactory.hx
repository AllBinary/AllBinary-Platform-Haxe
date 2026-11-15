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


class SmallLongFactory {
    private static final instance : SmallLongFactory = new SmallLongFactory();
    public static function getInstance() : SmallLongFactory {
        return SmallLongFactory.instance;
    }

    public final NEGATIVE_MAX : Int = 500;
    public final POSITIVE_MAX : Int = 0x2D1;
    private final INTEGER_ARRAY : haxe.ds.Vector<Null<haxe.Int64>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.NEGATIVE_MAX + this.POSITIVE_MAX) null]);
    private final STRING_ARRAY : haxe.ds.Vector<String> = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.NEGATIVE_MAX + this.POSITIVE_MAX) null]);
    public var MIN : Int = 0;
    public var lastMin : Int = 0;
    public var lastNegativeMin : Int = 0;
    public function initWithRange(value : Int, negativeValue : Int) : Void {
        {
            var index : Int = value - 1;
            while (index >= this.lastMin) {
            this.INTEGER_ARRAY[index + this.NEGATIVE_MAX] = index;
                index--;
            }
        }
        {
            var index : Int = negativeValue - 1;
            while (index >= this.lastNegativeMin) {
            this.INTEGER_ARRAY[index] = -index;
                index--;
            }
        }
        if (this.lastMin < value) {
            this.lastMin = value;
            this.MIN = value;
        }
        if (this.lastNegativeMin < negativeValue) {
            this.lastNegativeMin = negativeValue;
        }
    }

    public function init() : Void {
        if (this.INTEGER_ARRAY[0] == null) {
            if (this.lastMin < this.POSITIVE_MAX || this.lastNegativeMin < this.NEGATIVE_MAX) {
                {
                    var index : Int = this.POSITIVE_MAX - 1;
                    while (index >= this.lastMin) {
                    this.INTEGER_ARRAY[index + this.NEGATIVE_MAX] = index;
                        index--;
                    }
                }
                {
                    var index : Int = this.NEGATIVE_MAX - 1;
                    while (index >= this.lastNegativeMin) {
                    this.INTEGER_ARRAY[index] = -index;
                        index--;
                    }
                }
                this.lastMin = this.POSITIVE_MAX;
                this.lastNegativeMin = this.NEGATIVE_MAX;
            }
        }
    }

    public function new() {
    }

    public function getInstanceNoThrow(index : haxe.Int64) : Null<haxe.Int64> {
        if (index + haxe.Int64.ofInt(this.NEGATIVE_MAX) > haxe.Int64.ofInt(this.INTEGER_ARRAY.length - 1)) {
            return this.INTEGER_ARRAY[-1 + this.NEGATIVE_MAX];
        }
        return this.INTEGER_ARRAY[(haxe.Int64.toInt(index)) + this.NEGATIVE_MAX];
    }

    public function getString(index : Int) : String {
        final i : Int = index + this.NEGATIVE_MAX;
        if (this.STRING_ARRAY[i] == null) {
            this.STRING_ARRAY[i] = this.INTEGER_ARRAY[i].toString();
        }
        return this.STRING_ARRAY[i];
    }

}

