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
package org.allbinary.game.ag.layer.hud.basic.time;

//import javax.microedition.lcdui.Font;
//import javax.microedition.lcdui.Graphics;
import org.allbinary.game.graphics.hud.BasicHud;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.logic.math.PrimitiveLongSingleton;

class TimeHudWidget extends BasicHud {
    // throws Exception
    public static function getInstance(location : Int, direction : Int, basicColor : BasicColor, timer : Timer) : TimeHudWidget {
        return new TimeHudWidget(location, direction, 2, basicColor, timer);
    }

    private final TIME_STRING : String = "Time ";
    private final TIME_CHAR_ARRAY : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy(["T".code, "i".code, "m".code, "e".code, " ".code]);
    private var offset : Int = 0;
    private var string : haxe.ds.Vector<Int> = PrimitiveLongSingleton.getInstance().ZERO;
    private var totalDigits : Int = 1;
    private final timer : Timer;
    public function new(location : Int, direction : Int, bufferZone : Int, basicColor : BasicColor, timer : Timer) {
        super(location, direction, bufferZone, basicColor);
        this.timer = timer;
        this.set();
        this.updateMaxHeight = 14;
    }

    public override function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        this.updateMaxWidth = font.getSize() * 5;
        this.offset = font.stringWidth(this.TIME_STRING) + MyFontProcessor.defaultStringWidth(font, 3);
        super.updateMeasurement(graphics);
    }

    public function update() : Void {
        this.timer.update();
        this.set();
    }

    private function set() : Void {
        this.string = this.timer.getTimeChars();
        this.totalDigits = this.timer.getCurrentTotalDigits();
    }

    public function getTimer() : Timer {
        return this.timer;
    }

    public function paint(graphics : Graphics) : Void {
        super.paintDX(graphics, this.TIME_CHAR_ARRAY, 0, this.TIME_CHAR_ARRAY.length, this.string, 0, this.totalDigits, this.offset);
    }

}

