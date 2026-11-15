// Generated Code Do Not Modify
package org.allbinary.util;

import jsinterop.annotations.JsType;
import org.allbinary.logic.math.MathUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonSeps;
import jsinterop.annotations.JsMethod;

class ArrayUtil {
    private static final instance : ArrayUtil = new ArrayUtil();
    public static function getInstance() : ArrayUtil {
        return ArrayUtil.instance;
    }

    private final mathUtil : MathUtil = MathUtil.getInstance();
    public function copyOf(original : haxe.ds.Vector<Any>, newLength : Int) : haxe.ds.Vector<Any> {
        return this.copyOfType(original, newLength, Type.getClass(original));
    }

    public function copyOfType(original : haxe.ds.Vector<Any>, newLength : Int, newType : Class<Dynamic>) : haxe.ds.Vector<Any> {
        final copy : haxe.ds.Vector<Any> = haxe.ds.Vector.fromArrayCopy([for (index in 0...newLength) null]);
        haxe.ds.Vector.blit(original, 0, copy, 0, this.mathUtil.min(original.length, newLength));
        return copy;
    }

    public function copyOfbyte(original : haxe.ds.Vector<Int>, newLength : Int) : haxe.ds.Vector<Int> {
        final copy : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...newLength) 0]);
        haxe.ds.Vector.blit(original, 0, copy, 0, this.mathUtil.min(original.length, newLength));
        return copy;
    }

    public function copyOfshort(original : haxe.ds.Vector<Int>, newLength : Int) : haxe.ds.Vector<Int> {
        final copy : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...newLength) 0]);
        haxe.ds.Vector.blit(original, 0, copy, 0, this.mathUtil.min(original.length, newLength));
        return copy;
    }

    public function copyOfint(original : haxe.ds.Vector<Int>, newLength : Int) : haxe.ds.Vector<Int> {
        final copy : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...newLength) 0]);
        haxe.ds.Vector.blit(original, 0, copy, 0, this.mathUtil.min(original.length, newLength));
        return copy;
    }

    public function copyOflong(original : haxe.ds.Vector<haxe.Int64>, newLength : Int) : haxe.ds.Vector<haxe.Int64> {
        final copy : haxe.ds.Vector<haxe.Int64> = haxe.ds.Vector.fromArrayCopy([for (index in 0...newLength) haxe.Int64.ofInt(0)]);
        haxe.ds.Vector.blit(original, 0, copy, 0, this.mathUtil.min(original.length, newLength));
        return copy;
    }

    public function copyOfchar(original : haxe.ds.Vector<Int>, newLength : Int) : haxe.ds.Vector<Int> {
        final copy : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...newLength) 0]);
        haxe.ds.Vector.blit(original, 0, copy, 0, this.mathUtil.min(original.length, newLength));
        return copy;
    }

    public function copyOffloat(original : haxe.ds.Vector<Float>, newLength : Int) : haxe.ds.Vector<Float> {
        final copy : haxe.ds.Vector<Float> = haxe.ds.Vector.fromArrayCopy([for (index in 0...newLength) 0.0]);
        haxe.ds.Vector.blit(original, 0, copy, 0, this.mathUtil.min(original.length, newLength));
        return copy;
    }

    public function copyOfdouble(original : haxe.ds.Vector<Float>, newLength : Int) : haxe.ds.Vector<Float> {
        final copy : haxe.ds.Vector<Float> = haxe.ds.Vector.fromArrayCopy([for (index in 0...newLength) 0.0]);
        haxe.ds.Vector.blit(original, 0, copy, 0, this.mathUtil.min(original.length, newLength));
        return copy;
    }

    public function copyOfboolean(original : haxe.ds.Vector<Bool>, newLength : Int) : haxe.ds.Vector<Bool> {
        final copy : haxe.ds.Vector<Bool> = haxe.ds.Vector.fromArrayCopy([for (index in 0...newLength) false]);
        haxe.ds.Vector.blit(original, 0, copy, 0, this.mathUtil.min(original.length, newLength));
        return copy;
    }

    public function reverse(intArray : haxe.ds.Vector<Int>) : Void {
        final length : Int = intArray.length - 1;
        var temp : Int = 0;
        final size : Int = Std.int(length / 2);
        for (index in 0...size + 1) {
            temp = intArray[index];
            intArray[index] = intArray[length - index];
            intArray[length - index] = temp;
        }
    }

    public function flip(intArray : haxe.ds.Vector<Int>, width : Int, height : Int) : Void {
        final length : Int = height - 1;
        var temp : Int = 0;
        var index : Int = 0;
        var rowIndex : Int = 0;
        for (y in 0...Std.int(length / 2) + 1) {
            for (x in 0...width) {
                rowIndex = ((length - y) * width);
                index = x + (y * width);
                temp = intArray[index];
                intArray[index] = intArray[rowIndex + x];
                intArray[rowIndex + x] = temp;
            }
        }
    }

    public function toStringFromTwoDimensionaArray(twoDimensionalIntArray : haxe.ds.Vector<haxe.ds.Vector<Int>>) : String {
        final stringBuffer : StringMaker = new StringMaker();
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        final endIndex : Int = twoDimensionalIntArray.length;
        final endIndex2 : Int = twoDimensionalIntArray[0].length;
        for (index in 0...endIndex) {
            stringBuffer.append(commonSeps.BRACE_OPEN);
            for (index2 in 0...endIndex2) {
                stringBuffer.appendint(Std.int(twoDimensionalIntArray[index][index2]));
                stringBuffer.append(commonSeps.COMMA_SEP);
            }
            stringBuffer.append(commonSeps.BRACE_CLOSE);
            stringBuffer.append(commonSeps.NEW_LINE);
        }
        return stringBuffer.toString();
    }

    public function toStringFromObjectArray(objectArray : haxe.ds.Vector<Any>) : String {
        final stringBuffer : StringMaker = new StringMaker();
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        for (index in 0...objectArray.length) {
            stringBuffer.append(StringUtil.getInstance().toString(objectArray[index]));
            stringBuffer.append(commonSeps.COMMA_SEP);
        }
        return stringBuffer.toString();
    }

    public function toStringFromByteArray(byteArray : haxe.ds.Vector<Int>) : String {
        final stringBuffer : StringMaker = new StringMaker();
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        for (index in 0...byteArray.length) {
            stringBuffer.appendbyte(byteArray[index]);
            stringBuffer.append(commonSeps.COMMA_SEP);
        }
        return stringBuffer.toString();
    }

    public function new() {
    }
}

