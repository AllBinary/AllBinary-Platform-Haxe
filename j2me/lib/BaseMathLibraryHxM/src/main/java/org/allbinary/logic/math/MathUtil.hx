// Generated Code Do Not Modify
package org.allbinary.logic.math;

import jsinterop.annotations.JsType;

class MathUtil {
    private static final instance : MathUtil = new MathUtil();
    public static function getInstance() : MathUtil {
        return MathUtil.instance;
    }

    public function getTotalDigits(digits : Int) : Int {
        var total : Int = 0;
        while (digits > 0) {
            digits = Std.int(digits / 10);
            total++;
        }
        return total;
    }

    public function sqrt(value : Int) : Int {
        if (value <= 1) {
            return value;
        }
        var accumulated : Int = value >> 1;
        var result : Int = (accumulated + (Std.int(value / accumulated))) >> 1;
        do {
            accumulated = result;
            result = (accumulated + (Std.int(value / accumulated))) >> 1;
        } while (accumulated > result);
        return accumulated;
    }

    private final ACCURACY : Int = 100;
    public function sqrtd(x : Int) : Float {
        if (x == 0) {
            return 0.0;
        }
        if (x < 0) {
            return -1.0;
        }
        var result : Float = x;
        for (index in 0...this.ACCURACY) {
            result = (result + (x / result)) / 2.0;
        }
        return result;
    }

    public function abs(value : Int) : Int {
        return ((value < 0) ? -value : value);
    }

    public function abslong(value : haxe.Int64) : haxe.Int64 {
        return ((value < 0) ? -value : value);
    }

    public function min(value : Int, value2 : Int) : Int {
        return ((value <= value2) ? value : value2);
    }

    public function max(value : Int, value2 : Int) : Int {
        return ((value >= value2) ? value : value2);
    }

    public function new() {
    }
}

