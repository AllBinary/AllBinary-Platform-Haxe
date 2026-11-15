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

import org.allbinary.AndroidUtil;
import org.allbinary.J2MEUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;

class SmallIntegerSingletonFactory {
    private static final instance : SmallIntegerSingletonFactory = new SmallIntegerSingletonFactory();
    public static function getInstance() : SmallIntegerSingletonFactory {
        return SmallIntegerSingletonFactory.instance;
    }

    public final NEGATIVE_MAX : Int = 500;
    public final POSITIVE_MAX : Int = 0x2D1;
    private final INTEGER_ARRAY : haxe.ds.Vector<Null<Int>>;
    private final STRING_ARRAY : haxe.ds.Vector<String>;
    private var MIN : Int = 0;
    private var lastMin : Int = 0;
    private var lastNegativeMin : Int = 0;
    public function getMin() : Int {
        final minAllowed : Int = this.getMinAllowed();
        if (this.MIN <= minAllowed) {
            if (J2MEUtil.isJ2ME()) {
            } else if (AndroidUtil.isAndroid()) {
                final logUtil : LogUtil = LogUtil.getInstance();
                logUtil.putF(Std.string(new StringMaker().append("Android InputFactory was initialized before GameMidlet: ").appendint(this.MIN)), this, "getMin");
                this.initWithRange(0x291, 6);
            } else {
                final logUtil : LogUtil = LogUtil.getInstance();
                logUtil.putF(Std.string(new StringMaker().append("InputFactory was initialized before GameMidlet or KeyFactoryInitializer - Currently this is occurs on JS build by TouchMotionGestureFactory constructor: ").appendint(this.MIN)), this, "getMin");
                this.initWithRange(0x2D0, 6);
            }
        }
        if (this.MIN <= minAllowed) {
            final logUtil : LogUtil = LogUtil.getInstance();
            logUtil.put("This means you loaded the InputFactory before determining the platform input size requirements.", this, "getMin", new jre.lang.JavaException());
        }
        return this.MIN;
    }

    private function getMinAllowed() : Int {
        if (J2MEUtil.isJ2ME()) {
            return 0;
        } else {
            if (AndroidUtil.isAndroid()) {
                return 0x101;
            } else {
                return 23;
            }
        }
    }

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
            this.MIN = this.lastMin;
            this.lastNegativeMin = this.NEGATIVE_MAX;
        }
    }

    public function new() {
        this.INTEGER_ARRAY = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.NEGATIVE_MAX + this.POSITIVE_MAX) null]);
        this.STRING_ARRAY = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.NEGATIVE_MAX + this.POSITIVE_MAX) null]);
        this.initWithRange(23, 0);
    }

    public function getAt(index : Int) : Null<Int> {
        return this.INTEGER_ARRAY[index + this.NEGATIVE_MAX];
    }

    public function getAtNoThrow(index : Int) : Null<Int> {
        if (index + this.NEGATIVE_MAX > this.INTEGER_ARRAY.length - 1) {
            return this.INTEGER_ARRAY[-1 + this.NEGATIVE_MAX];
        }
        return this.INTEGER_ARRAY[index + this.NEGATIVE_MAX];
    }

    public function createInstance(index : Int) : Null<Int> {
        var integer : Null<Int> = this.getAt(index);
        if (integer == null) {
            integer = index;
        }
        return integer;
    }

    public function getString(index : Int) : String {
        final i : Int = index + this.NEGATIVE_MAX;
        if (this.STRING_ARRAY[i] == null) {
            this.STRING_ARRAY[i] = Std.string(this.INTEGER_ARRAY[i]);
        }
        return this.STRING_ARRAY[i];
    }

}

