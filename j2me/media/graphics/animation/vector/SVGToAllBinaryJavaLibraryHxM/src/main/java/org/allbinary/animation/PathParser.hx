// Generated Code Do Not Modify
package org.allbinary.animation;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.StdUtil;

class PathParser {
    private static function tokenize(d : String) : haxe.ds.Vector<String> {
        final tokens : BasicArrayList = new BasicArrayListD();
        final sb : StringBuf = new StringBuf();
        for (i in 0...d.length) {
            var c : Int = d.charCodeAt(i);
            if (c == " ".code || c == ",".code || c == "\t".code || c == "\n".code || c == "\r".code) {
                if (sb.length() > 0) {
                    tokens.add(sb.toString());
                    sb.setLength(0);
                }
            } else if (c == "M".code || c == "m".code || c == "L".code || c == "l".code || c == "V".code || c == "v".code || c == "C".code || c == "c".code || c == "Z".code || c == "z".code) {
                if (sb.length() > 0) {
                    tokens.add(sb.toString());
                    sb.setLength(0);
                }
                tokens.add(Std.string(c));
            } else {
                sb.append(c);
            }
        }
        if (sb.length() > 0) {
            tokens.add(sb.toString());
        }
        final res : haxe.ds.Vector<String> = haxe.ds.Vector.fromArrayCopy([for (index in 0...tokens.size()) null]);
        tokens.toArrayType(res);
        return res;
    }

    public static function parsePath(d : String, outX : haxe.ds.Vector<Int>, outY : haxe.ds.Vector<Int>, maxPoints : Int) : Int {
        var tokens : haxe.ds.Vector<String> = tokenize(d);
        var count : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([0]);
        final fixedPoint : FixedPoint = FixedPoint.getInstance();
        var curX : Int = 0;
        var curY : Int = 0;
        var startX : Int = 0;
        var startY : Int = 0;
        var idx : Int = 0;
        while (idx < tokens.length) {
            var tok : String = tokens[idx++];
            var cmd : Int = tok.charCodeAt(0);
            if (cmd == "M".code || cmd == "m".code) {
                var x : Int = fixedPoint.toFixed(Std.parseFloat(tokens[idx++]));
                var y : Int = fixedPoint.toFixed(Std.parseFloat(tokens[idx++]));
                if (cmd == "m".code) {
                    x += curX;
                    y += curY;
                }
                curX = x;
                curY = y;
                startX = x;
                startY = y;
                outX[count[0]] = curX;
                outY[count[0]] = curY;
                count[0]++;
            } else if (cmd == "L".code || cmd == "l".code) {
                var x : Int = fixedPoint.toFixed(Std.parseFloat(tokens[idx++]));
                var y : Int = fixedPoint.toFixed(Std.parseFloat(tokens[idx++]));
                if (cmd == "l".code) {
                    x += curX;
                    y += curY;
                }
                curX = x;
                curY = y;
                outX[count[0]] = curX;
                outY[count[0]] = curY;
                count[0]++;
            } else if (cmd == "V".code || cmd == "v".code) {
                var y : Int = fixedPoint.toFixed(Std.parseFloat(tokens[idx++]));
                if (cmd == "v".code) {
                    y += curY;
                }
                curY = y;
                outX[count[0]] = curX;
                outY[count[0]] = curY;
                count[0]++;
            } else if (cmd == "C".code || cmd == "c".code) {
                var x1 : Int = fixedPoint.toFixed(Std.parseFloat(tokens[idx++]));
                var y1 : Int = fixedPoint.toFixed(Std.parseFloat(tokens[idx++]));
                var x2 : Int = fixedPoint.toFixed(Std.parseFloat(tokens[idx++]));
                var y2 : Int = fixedPoint.toFixed(Std.parseFloat(tokens[idx++]));
                var x3 : Int = fixedPoint.toFixed(Std.parseFloat(tokens[idx++]));
                var y3 : Int = fixedPoint.toFixed(Std.parseFloat(tokens[idx++]));
                if (cmd == "c".code) {
                    x1 += curX;
                    y1 += curY;
                    x2 += curX;
                    y2 += curY;
                    x3 += curX;
                    y3 += curY;
                }
                PGUtil.getInstance().flattenCubicBezier(curX, curY, x1, y1, x2, y2, x3, y3, outX, outY, count, maxPoints);
                curX = x3;
                curY = y3;
            } else if (cmd == "Z".code || cmd == "z".code) {
                curX = startX;
                curY = startY;
                outX[count[0]] = curX;
                outY[count[0]] = curY;
                count[0]++;
            }
            while (idx < tokens.length && !isCommand(tokens[idx])) {
                if (cmd == "M".code || cmd == "m".code || cmd == "L".code || cmd == "l".code) {
                    var x : Int = fixedPoint.toFixed(Std.parseFloat(tokens[idx++]));
                    var y : Int = fixedPoint.toFixed(Std.parseFloat(tokens[idx++]));
                    if (cmd == "m".code || cmd == "l".code) {
                        x += curX;
                        y += curY;
                    }
                    curX = x;
                    curY = y;
                    outX[count[0]] = curX;
                    outY[count[0]] = curY;
                    count[0]++;
                } else if (cmd == "V".code || cmd == "v".code) {
                    var y : Int = fixedPoint.toFixed(Std.parseFloat(tokens[idx++]));
                    if (cmd == "v".code) {
                        y += curY;
                    }
                    curY = y;
                    outX[count[0]] = curX;
                    outY[count[0]] = curY;
                    count[0]++;
                }
            }
        }
        return count[0];
    }

    private static function isCommand(tok : String) : Bool {
        var c : Int = tok.charCodeAt(0);
        return "MmLlVvCcZz".indexOf(c) >= 0;
    }

    public function new() {
    }
}

