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
import org.allbinary.graphics.Anchor;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.color.BasicColorSetUtil;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.font.FontDebugFactory;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;
import org.allbinary.graphics.paint.InitUpdatePaintable;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;

class StartIntermissionPaintable extends InitUpdatePaintable implements UpdateMyFontInterface {
    public final fontDebugFactory : FontDebugFactory = FontDebugFactory.getInstance();
    public final basicSetColorUtil : BasicColorSetUtil = BasicColorSetUtil.getInstance();
    public final gameCanvas : AllBinaryGameCanvas;
    public final stringArray : haxe.ds.Vector<String>;
    public final fontSize : Int;
    public final font : Font;
    public final lastWidth : haxe.ds.Vector<Int>;
    private final updateMyFontProcessor : MyFontProcessor;
    private var myFontProcessor : MyFontProcessor;
    private var basicColor : BasicColor = BasicColorFactory.getInstance().BLACK;
    private var color : Int;
    public var lineYOffsetArray : haxe.ds.Vector<Int> = NullUtil.getInstance().NULL_INT_ARRAY;
    private var hasChanged : Bool = true;
    private var anchor : Int = Anchor.TOP_LEFT;
    public var fontHeightP : Int = 0;
    public function new(gameCanvas : AllBinaryGameCanvas, stringArray : haxe.ds.Vector<String>, basicColor : BasicColor, font : Font) {
        super();
        this.updateMyFontProcessor = new UpdateMyFontProcessor(this);
        this.myFontProcessor = this.updateMyFontProcessor;
        this.gameCanvas = gameCanvas;
        this.stringArray = stringArray;
        this.lastWidth = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.stringArray.length) 0]);
        this.setBasicColorP(basicColor);
        this.color = basicColor.intValue();
        this.fontSize = font.getSize();
        this.font = font;
    }

    public function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        this.fontHeightP = font.getHeight();
        this.myFontProcessor = MyFontProcessor.getInstance();
    }

    public override function paint(graphics : Graphics) : Void {
        this.myFontProcessor.process(graphics);
        final existingFont : Font = graphics.getFont();
        this.fontDebugFactory.setFont(this.font, graphics);
        final displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
        this.basicSetColorUtil.setBasicColorP3(graphics, this.basicColor, this.color);
        var beginWidth : Int = 0;
        {
            var index : Int = this.lineYOffsetArray.length - 1;
            while (index >= 0) {
            if (this.hasChanged) {
                this.lastWidth[index] = (graphics.getFont().stringWidth(this.stringArray[index]) >> 1);
            }
            beginWidth = this.lastWidth[index];
            graphics.drawString(this.stringArray[index], displayInfo.getLastHalfWidth() - beginWidth, displayInfo.getLastHalfHeight() - this.lineYOffsetArray[index], this.anchor);
                index--;
            }
        }
        this.hasChanged = false;
        this.fontDebugFactory.setFont(existingFont, graphics);
    }

    private final BEGIN_LEVEL : String = "Begin Level ";
    private final EMPTY_STRING : String = StringUtil.getInstance().EMPTY_STRING;
    public override function update() : Void {
        var level : Int = this.gameCanvas.getLayerManager().getGameInfo().getCurrentLevel();
        this.stringArray[0] = Std.string(new StringMaker().append(this.BEGIN_LEVEL).appendint(level));
        {
            var index : Int = this.stringArray.length - 1;
            while (index >= 1) {
            this.stringArray[index] = this.EMPTY_STRING;
                index--;
            }
        }
    }

    public override function setBasicColorP(basicColor : BasicColor) : Void {
        this.basicColor = basicColor;
    }

    public function getBasicColorP() : BasicColor {
        return this.basicColor;
    }

}

