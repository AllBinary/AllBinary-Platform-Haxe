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

import javax.microedition.lcdui.Graphics;
import org.allbinary.game.input.PlayerGameInput;
import org.allbinary.game.input.event.GameKeyEvent;
import org.allbinary.game.score.displayable.HighScoresCanvas;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class HighScoresCanvasInputProcessor extends PlayerGameInput {
    private final highScoresCanvas : HighScoresCanvas;
    public function new(highScoresCanvas : HighScoresCanvas) {
        super(new BasicArrayListD(), new BasicArrayListD(), -1);
        this.highScoresCanvas = highScoresCanvas;
    }

    public function open() : Void {
    }

    public function close() : Void {
    }

    // synchronized
    public override function onPressGameKeyEvent(gameKeyEvent : GameKeyEvent) : Void {
        super.onPressGameKeyEvent(gameKeyEvent);
        this.update();
    }

    // synchronized
    public override function onDownGameKeyEvent(gameKeyEvent : GameKeyEvent) : Void {
        super.onDownGameKeyEvent(gameKeyEvent);
        this.update();
    }

    // synchronized
    public override function onUpGameKeyEvent(gameKeyEvent : GameKeyEvent) : Void {
        super.onUpGameKeyEvent(gameKeyEvent);
        this.update();
    }

    public function paint(graphics : Graphics) : Void {
    }

    public function getHighScoresCanvas() : HighScoresCanvas {
        return this.highScoresCanvas;
    }

}

