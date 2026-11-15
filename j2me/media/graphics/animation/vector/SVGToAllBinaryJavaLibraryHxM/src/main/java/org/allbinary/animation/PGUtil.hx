// Generated Code Do Not Modify
package org.allbinary.animation;


class PGUtil {
    private static final instance : PGUtil = new PGUtil();
    public static function getInstance() : PGUtil {
        return PGUtil.instance;
    }

    public function flattenCubicBezier(x0 : Int, y0 : Int, x1 : Int, y1 : Int, x2 : Int, y2 : Int, x3 : Int, y3 : Int, outX : haxe.ds.Vector<Int>, outY : haxe.ds.Vector<Int>, count : haxe.ds.Vector<Int>, maxPoints : Int) : Void {
        final fixedPoint : FixedPoint = FixedPoint.getInstance();
        var steps : Int = 10;
        for (i in 1...steps + 1) {
            var t : Int = fixedPoint.div(fixedPoint.toFixed(i), fixedPoint.toFixed(steps));
            var mt : Int = fixedPoint.ONE - t;
            var mt3 : Int = fixedPoint.mul(fixedPoint.mul(mt, mt), mt);
            var mt2t3 : Int = 3 * fixedPoint.mul(fixedPoint.mul(mt, mt), t);
            var mtt23 : Int = 3 * fixedPoint.mul(fixedPoint.mul(mt, t), t);
            var t3 : Int = fixedPoint.mul(fixedPoint.mul(t, t), t);
            var x : Int = fixedPoint.mul(mt3, x0) + fixedPoint.mul(mt2t3, x1) + fixedPoint.mul(mtt23, x2) + fixedPoint.mul(t3, x3);
            var y : Int = fixedPoint.mul(mt3, y0) + fixedPoint.mul(mt2t3, y1) + fixedPoint.mul(mtt23, y2) + fixedPoint.mul(t3, y3);
            if (count[0] < maxPoints) {
                outX[count[0]] = x;
                outY[count[0]] = y;
                count[0]++;
            }
        }
    }

    public function new() {
    }
}

