// Generated Code Do Not Modify
package org.allbinary.animation;


class FixedPoint {
    private static final instance : FixedPoint = new FixedPoint();
    public static function getInstance() : FixedPoint {
        return FixedPoint.instance;
    }

    public final ONE : Int = 1 << 16;
    public function toFixed(val : Float) : Int {
        return Std.int((val * 65536.0));
    }

    public function toFixed(val : Float) : Int {
        return Std.int((val * 65536.0));
    }

    public function mul(a : Int, b : Int) : Int {
        return haxe.Int64.toInt(((haxe.Int64.ofInt(a) * haxe.Int64.ofInt(b)) >> 16));
    }

    public function div(a : Int, b : Int) : Int {
        return haxe.Int64.toInt((((haxe.Int64.ofInt(a)) << 16) / haxe.Int64.ofInt(b)));
    }

    public function toInt(fixed : Int) : Int {
        return fixed >> 16;
    }

    public function new() {
    }
}

