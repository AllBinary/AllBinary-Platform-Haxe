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
package org.allbinary.game.rand;

import jre.util.Random;
//import jsinterop.annotations.JsType;
//import jsinterop.annotations.JsMethod;
//import jsinterop.annotations.JsConstructor;
import org.allbinary.logic.math.MathUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;

//Do not use in client code for money related things.
class MyRandomFactory {
    private static final instance : MyRandomFactory = new MyRandomFactory();
    public static function getInstance() : MyRandomFactory {
        return MyRandomFactory.instance;
    }

    private final mathUtil : MathUtil = MathUtil.getInstance();
    private var rand : Random;
    public function new() {
        this.rand = new Random(haxe.Int64.fromFloat(Date.now().getTime()));
    }

    public function setSeed(seed : haxe.Int64) : Void {
        this.rand = new Random(seed);
    }

    public function getNextInt(range : Int) : Int {
        var div : Int = (jre.lang.JavaNumber.divide(Integer.MAX_VALUE, range)) + 1;
        return jre.lang.JavaNumber.toInt((jre.lang.JavaNumber.divide(this.rand.nextInt(), div)));
    }

    public function getAbsoluteNextInt(range : Int) : Int {
        return this.mathUtil.abs(this.getNextInt(range));
    }

    public function getAbsoluteNextIntAllowZero(range : Int) : Int {
        if (range == 0) {
            return 0;
        } else {
            return this.mathUtil.abs(this.getNextInt(range));
        }
    }

    public function shuffle(intArray : haxe.ds.Vector<Int>) : Void {
        this.shuffleTotal(intArray, intArray.length * 7);
    }

    public function shuffleTotal(intArray : haxe.ds.Vector<Int>, shuffleTotal : Int) : Void {
        final size : Int = intArray.length;
        var randomIndex : Int = 0;
        var randomIndex2 : Int = 0;
        var value : Int = 0;
        for (index in 0...shuffleTotal) {
            randomIndex = this.getAbsoluteNextIntAllowZero(size);
            randomIndex2 = this.getAbsoluteNextIntAllowZero(size);
            value = intArray[randomIndex];
            intArray[randomIndex] = intArray[randomIndex2];
            intArray[randomIndex2] = value;
        }
    }

    public function shuffle2(intArray : haxe.ds.Vector<Int>, intArray2 : haxe.ds.Vector<Int>) : Void {
        this.shuffle2Total(intArray, intArray2, intArray.length * 7);
    }

    public function shuffle2Total(intArray : haxe.ds.Vector<Int>, intArray2 : haxe.ds.Vector<Int>, shuffleTotal : Int) : Void {
        final size : Int = intArray.length;
        var randomIndex : Int = 0;
        var randomIndex2 : Int = 0;
        var value : Int = 0;
        var value2 : Int = 0;
        for (index in 0...shuffleTotal) {
            randomIndex = this.getAbsoluteNextIntAllowZero(size);
            randomIndex2 = this.getAbsoluteNextIntAllowZero(size);
            value = intArray[randomIndex];
            value2 = intArray2[randomIndex];
            intArray[randomIndex] = intArray[randomIndex2];
            intArray[randomIndex2] = value;
            intArray2[randomIndex] = intArray2[randomIndex2];
            intArray2[randomIndex2] = value2;
        }
    }

    public static function main(args : haxe.ds.Vector<String>) : Void {
        final randomFactory : MyRandomFactory = MyRandomFactory.getInstance();
        final stringBuilder : StringMaker = new StringMaker();
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        final size2 : Int = 100;
        for (index in 0...size2) {
            stringBuilder.appendint(jre.lang.JavaNumber.toInt(randomFactory.getAbsoluteNextInt(3))).append(commonSeps.COMMA);
        }
        trace(Std.string(stringBuilder));
        stringBuilder.delete(0, stringBuilder.length());
        final intArray : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...52) 0]);
        final intArray2 : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...52) 0]);
        final size : Int = intArray.length;
        for (index in 0...size) {
            intArray[index] = index;
            intArray2[index] = index;
        }
        randomFactory.shuffle2(intArray, intArray2);
        for (index in 0...size) {
            stringBuilder.appendint(intArray[index]).append(commonSeps.COMMA);
        }
        trace(Std.string(stringBuilder));
        stringBuilder.delete(0, stringBuilder.length());
        for (index in 0...size) {
            stringBuilder.appendint(intArray2[index]).append(commonSeps.COMMA);
        }
        trace(Std.string(stringBuilder));
        var found : Bool = false;
        for (index in 0...size) {
            found = false;
            for (index2 in 0...size) {
                if (intArray[index2] == index) {
                    found = true;
                }
            }
            if (!found) {
                throw new jre.lang.JavaException();
            }
        }
    }

}

