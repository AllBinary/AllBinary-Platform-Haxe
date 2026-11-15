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
package org.allbinary.graphics.color;

//import jsinterop.annotations.JsType;
import org.allbinary.logic.string.StringMaker;
//import jsinterop.annotations.JsMethod;
//import jsinterop.annotations.JsConstructor;
//import jsinterop.annotations.JsProperty;

class BasicColor {
    private final name : String;
    private final value : Int;
    private final redComponent : Float;
    private final greenComponent : Float;
    private final blueComponent : Float;
    private final alphaComponent : Float;
    public final red : Int;
    public final green : Int;
    public final blue : Int;
    public final alpha : Int;
    public function new(alphaValue : Int, value : Int, name : String) {
        this.name = name;
        var tempValue : Int = 0;
        final basicColorUtil : BasicColorUtil = BasicColorUtil.getInstance();
        if (basicColorUtil.isAlpha) {
            if (basicColorUtil.ffOpaque) {
                tempValue = alphaValue | value;
            } else {
                tempValue = 0x00000000 | value;
            }
        } else {
            tempValue = value;
        }
        var alphaInt : Int = ((tempValue >> 24) & 255);
        this.alpha = alphaInt;
        this.alphaComponent = (alphaInt) / 255.0;
        var redInt : Int = ((tempValue >> 16) & 255);
        this.red = redInt;
        this.redComponent = (redInt) / 255.0;
        var greenInt : Int = ((tempValue >> 8) & 255);
        this.green = greenInt;
        this.greenComponent = (greenInt) / 255.0;
        var blueInt : Int = ((tempValue) & 255);
        this.blue = blueInt;
        this.blueComponent = (blueInt) / 255.0;
        this.value = tempValue;
    }

    public function intValue() : Int {
        return this.value;
    }

    public function toInt() : Int {
        return this.value;
    }

    public function toString() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("BasicColor: ");
        stringBuffer.append("Alpha: ");
        stringBuffer.appendshort(this.alpha);
        stringBuffer.append(" Red: ");
        stringBuffer.appendshort(this.red);
        stringBuffer.append(" Green: ");
        stringBuffer.appendshort(this.green);
        stringBuffer.append(" Blue: ");
        stringBuffer.appendshort(this.blue);
        stringBuffer.append(" Value: ");
        stringBuffer.appendint(this.value);
        return Std.string(stringBuffer);
    }

    public function getName() : String {
        return this.name;
    }

    public function getRedComponent() : Float {
        return this.redComponent;
    }

    public function getGreenComponent() : Float {
        return this.greenComponent;
    }

    public function getBlueComponent() : Float {
        return this.blueComponent;
    }

    public function getAlphaComponent() : Float {
        return this.alphaComponent;
    }

}

