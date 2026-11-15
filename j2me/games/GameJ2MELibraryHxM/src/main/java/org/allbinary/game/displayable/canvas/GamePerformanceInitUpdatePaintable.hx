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
package org.allbinary.game.displayable.canvas;

import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.Graphics;
import org.allbinary.canvas.GameStatisticsFactory;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;
import org.allbinary.graphics.paint.InitUpdatePaintable;

class GamePerformanceInitUpdatePaintable extends InitUpdatePaintable implements UpdateMyFontInterface {
    private final halfHeight : Int = DisplayInfoSingleton.getInstance().getLastHalfHeight();
    private final yArray : haxe.ds.Vector<Int>;
    private var myFontProcessor : MyFontProcessor;
    private var baseRefreshHelperCharArray : haxe.ds.Vector<haxe.ds.Vector<Int>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...0) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...0) 0])]);
    private var defaultStringWidth : Int = 0;
    public override function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        this.defaultStringWidth = MyFontProcessor.defaultStringWidth(font, 2);
        this.myFontProcessor = MyFontProcessor.getInstance();
    }

    public override function init() : Void {
    }

    public override function update() : Void {
        this.baseRefreshHelperCharArray = GameStatisticsFactory.getInstance().to2DCharArray();
    }

    private final RED : Int = Std.int(BasicColorFactory.getInstance().RED);
    public override function paint(graphics : Graphics) : Void {
        this.myFontProcessor.process(graphics);
        graphics.setColor(this.RED);
        var charArray : haxe.ds.Vector<Int> = null;
        var charArray2 : haxe.ds.Vector<Int> = null;
        var size2 : Int = 0;
        var size3 : Int = 0;
        final size : Int = this.baseRefreshHelperCharArray.length - 2;
        {
            var index : Int = size;
            while (index >= 0) {
            charArray = this.baseRefreshHelperCharArray[index];
            charArray2 = this.baseRefreshHelperCharArray[index + 1];
            size2 = charArray.length;
            size3 = charArray2.length;
            graphics.drawChars(charArray, 0, size2, 0, this.yArray[index], 0);
            graphics.drawChars(charArray2, 0, size3, size2 * this.defaultStringWidth, this.yArray[index + 1], 0);
                index -= 2;
            }
        }
    }

    public function new() {
        super();
        this.yArray = haxe.ds.Vector.fromArrayCopy([this.halfHeight + 30, this.halfHeight + 30, this.halfHeight + 30 + 15, this.halfHeight + 30 + 15, this.halfHeight + 30 + 30, this.halfHeight + 30 + 30, this.halfHeight + 30 + 45, this.halfHeight + 30 + 45]);
        this.myFontProcessor = new UpdateMyFontProcessor(this);
    }
}

