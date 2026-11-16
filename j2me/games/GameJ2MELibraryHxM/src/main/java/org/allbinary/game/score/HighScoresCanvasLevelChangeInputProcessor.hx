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
package org.allbinary.game.score;

import javax.microedition.lcdui.Canvas;
import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.Graphics;
import org.allbinary.game.input.event.GameKeyEventHandler;
import org.allbinary.game.input.event.GameKeyEventUtil;
import org.allbinary.game.score.displayable.HighScoresCanvas;
import org.allbinary.graphics.Anchor;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;
import org.allbinary.util.BasicArrayList;

class HighScoresCanvasLevelChangeInputProcessor extends HighScoresCanvasInputProcessor implements UpdateMyFontInterface {
    private final displayInfoSingleton : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
    private final INSTRUCTIONS : String = "(Right = Next Track, Left = Previous Track)";
    private var myFontProcessor : MyFontProcessor;
    private var anchor : Int = Anchor.TOP_LEFT;
    private var fontHeight : Int = 0;
    public function new(highScoresCanvas : HighScoresCanvas) {
        super(highScoresCanvas);
        this.myFontProcessor = new UpdateMyFontProcessor(this);
    }

    public function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        this.fontHeight = font.getHeight();
        this.myFontProcessor = MyFontProcessor.getInstance();
    }

    public override function open() : Void {
        GameKeyEventHandler.getInstance().addListener(this);
    }

    public override function close() : Void {
        GameKeyEventHandler.getInstance().removeListener(this);
    }

    // synchronized
    public override function update() : Void {
        final list : BasicArrayList = this.getGameKeyEventList();
        final size : Int = list.size();
        for (index in 0...size) {
            final anyType : Any = list.objectArray[index];
            final key : Int = GameKeyEventUtil.getKey(anyType);
            if (key == Canvas.RIGHT) {
                this.getHighScoresCanvas().getGameInfo().nextGameLevel();
            } else if (key == Canvas.LEFT) {
                this.getHighScoresCanvas().getGameInfo().previousGameLevel();
            }
            this.getHighScoresCanvas().executeUpdate();
        }
        list.clear();
    }

    public override function paint(graphics : Graphics) : Void {
        this.myFontProcessor.process(graphics);
        final width : Int = this.displayInfoSingleton.getLastWidth();
        final topScoresWidth : Int = (graphics.getFont().stringWidth(this.INSTRUCTIONS) >> 1);
        graphics.drawString(this.INSTRUCTIONS, (width >> 1) - topScoresWidth, this.fontHeight * 2, this.anchor);
    }

}

