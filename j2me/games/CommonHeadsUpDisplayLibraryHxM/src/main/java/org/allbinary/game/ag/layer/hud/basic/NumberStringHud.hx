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
package org.allbinary.game.ag.layer.hud.basic;

import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.Graphics;
import org.allbinary.game.graphics.hud.BasicHud;
import org.allbinary.game.graphics.hud.BasicHudFactory;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.paint.PaintableInterface;
import org.allbinary.logic.math.PrimitiveLongSingleton;
import org.allbinary.logic.math.PrimitiveLongUtil;

class NumberStringHud extends BasicHud implements PaintableInterface {
    private final primitiveLongUtil : PrimitiveLongUtil;
    private final prependString : String;
    private final PREPEND_STRING : haxe.ds.Vector<Int>;
    private var value : Int;
    private var max : Int;
    private var offset : Int = 0;
    private var valueString : haxe.ds.Vector<Int>;
    private var valueTotalDigits : Int = 0;
    public function new(prependString : String, max : Int, location : Int, direction : Int, bufferZone : Int, basicColor : BasicColor) {
        super(location, direction, bufferZone, basicColor);
        this.prependString = prependString;
        this.PREPEND_STRING = haxe.ds.Vector.fromArrayCopy([for (index in 0...prependString.length) prependString.charCodeAt(index)]);
        this.valueString = PrimitiveLongSingleton.getInstance().NUMBER_CHAR_ARRAYS[0];
        this.primitiveLongUtil = PrimitiveLongUtil.createPowerOfTen(max + 1);
        this.max = max;
        this.value = 0;
        if (direction == 0) {
            throw new jre.lang.JavaException(BasicHudFactory.getInstance().DIRECTION_EXCEPTION);
        }
    }

    public override function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        this.offset = font.stringWidth(this.prependString) + MyFontProcessor.defaultCharWidth(font);
        super.updateMeasurement(graphics);
    }

    public function get() : Int {
        return this.value;
    }

    public function add(value : Int) : Void {
        this.set(this.value + value);
    }

    public function set(value : Int) : Void {
        this.value = value;
        if (this.value > this.max) {
            this.value = 0;
        }
        this.valueString = this.primitiveLongUtil.getCharArray(this.value);
        this.valueTotalDigits = this.primitiveLongUtil.getCurrentTotalDigits();
    }

    public function reduce(value : Int) : Void {
        this.set(this.value - value);
    }

    public function paint(graphics : Graphics) : Void {
        super.paintDX(graphics, this.PREPEND_STRING, 0, this.PREPEND_STRING.length, this.valueString, 0, this.valueTotalDigits, this.offset);
    }

    public function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        this.myFontProcessor.process(graphics);
        var charArray : haxe.ds.Vector<Int> = this.PREPEND_STRING;
        var len : Int = this.PREPEND_STRING.length;
        var charArray2 : haxe.ds.Vector<Int> = this.valueString;
        var len2 : Int = this.valueTotalDigits;
        this.basicSetColorUtil.setBasicColorP(graphics, this.getBasicColorP());
        graphics.drawChars(charArray, 0, len, x, y, 0);
        graphics.drawChars(charArray2, 0, len2, x - this.offset, y, 0);
    }

    public function paintThreed(graphics : Graphics) : Void {
    }

}

