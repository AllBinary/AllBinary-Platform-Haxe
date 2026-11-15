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
package org.allbinary.game.layer.hud.basic;

//import javax.microedition.lcdui.Font;
//import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.opengles.OpenGLFeatureUtil;
import org.allbinary.game.graphics.hud.BasicHud;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.logic.math.MathUtil;
import org.allbinary.logic.math.PrimitiveLongSingleton;
import org.allbinary.logic.math.PrimitiveLongUtil;

class VelocityWidget extends BasicHud {
    private final KILOMETERS_PER_HOUR_STR : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([" ".code, "k".code, "m".code, "/".code, "h".code]);
    private final totalChars : Int = this.KILOMETERS_PER_HOUR_STR.length;
    private var velocity : Int;
    private var maxVelocity : Int;
    private var string : haxe.ds.Vector<Int> = PrimitiveLongSingleton.getInstance().ZERO;
    private var totalDigits : Int = 1;
    private final powerOfTenVelocity : Int;
    private final primitiveLongUtil : PrimitiveLongUtil;
    private var offset : Int = 0;
    private var offset2 : Int = 0;
    public function new(powerOfTenVelocity : Int, location : Int, direction : Int, basicColor : BasicColor) {
        super(location, direction, 2, basicColor);
        this.powerOfTenVelocity = powerOfTenVelocity;
        this.maxVelocity = powerOfTenVelocity;
        this.velocity = 0;
        this.primitiveLongUtil = PrimitiveLongUtil.createPowerOfTen(powerOfTenVelocity);
        this.updateMaxHeight = 14;
    }

    public override function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        this.updateMaxWidth = font.getSize() * (5 + MathUtil.getInstance().getTotalDigits(this.powerOfTenVelocity) + 1);
        super.updateMeasurement(graphics);
        this.offset = MyFontProcessor.defaultStringWidth(font, this.primitiveLongUtil.getMaxDigits()) + MyFontProcessor.defaultStringWidth(font, 2);
        this.offset2 = this.offset - MyFontProcessor.defaultStringWidth(font, this.totalDigits) - MyFontProcessor.defaultStringWidth(font, 2);
    }

    public function get() : Int {
        return this.velocity;
    }

    public function add(value : Int) : Void {
        this.set(this.velocity + value);
    }

    public function set(value : Int) : Void {
        var lastVelocity : Int = this.velocity;
        this.velocity = value;
        if (this.velocity > this.maxVelocity) {
            this.velocity = 0;
        }
        if (lastVelocity != this.velocity) {
            this.string = this.primitiveLongUtil.getCharArray(this.velocity * 18);
            if (OpenGLFeatureUtil.getInstance().isAnyThreed()) {
                this.totalDigits = this.primitiveLongUtil.getCurrentTotalDigits() + 1;
            } else {
                this.totalDigits = this.primitiveLongUtil.getCurrentTotalDigits();
            }
            this.myFontProcessor = this.updateMyFontProcessor;
        }
    }

    public function reduce(value : Int) : Void {
        this.set(this.velocity - value);
    }

    public function paint(graphics : Graphics) : Void {
        super.paintDXY(graphics, this.string, 0, this.totalDigits, this.KILOMETERS_PER_HOUR_STR, 0, this.totalChars, this.offset2, this.offset);
    }

}

