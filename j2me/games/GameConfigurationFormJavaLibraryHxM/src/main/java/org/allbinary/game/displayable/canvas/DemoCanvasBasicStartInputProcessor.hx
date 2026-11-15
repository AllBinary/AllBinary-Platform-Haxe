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

//import javax.microedition.lcdui.NullCanvas;
import org.allbinary.canvas.RunnableCanvas;
import org.allbinary.game.commands.GameCommandsFactory;
import org.allbinary.game.input.GameInputStrings;
import org.allbinary.game.input.event.GameKeyEvent;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.util.BasicArrayList;

class DemoCanvasBasicStartInputProcessor extends BasicMenuInputProcessor {
    public function new(gameKeyEventList : BasicArrayList, gameCanvas : RunnableCanvas) {
        super(gameKeyEventList, -1, gameCanvas);
    }

    // throws Exception
    public override function processInputList() : Int {
        var list : BasicArrayList = this.getGameKeyEventList();
        var size : Int = list.size();
        var gameKeyEvent : GameKeyEvent = null;
        for (index in 0...size) {
            gameKeyEvent = (cast list.objectArray[index] : GameKeyEvent);
            this.logUtil.putF(new StringMaker().append("Start GameKey: ").append(StringUtil.getInstance().toString(gameKeyEvent)).toString(), this, GameInputStrings.getInstance().PROCESS_INPUT);
        }
        this.getCanvas().getCustomCommandListener().commandAction(GameCommandsFactory.getInstance().START_COMMAND, NullCanvas.NULL_CANVAS);
        return size;
    }

}

