/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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
package org.allbinary.game.displayable;

import javax.microedition.lcdui.Canvas;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.thread.ARunnable;

class RepaintRunnable extends ARunnable {
    private final canvas : Canvas;
    public function new(canvas : Canvas) {
        super();
        this.canvas = canvas;
    }

    public override function run() : Void {
        try {
            this.canvas.repaint();
            DisplayInfoSingleton.getInstance().process();
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            final logUtil : LogUtil = LogUtil.getInstance();
            logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
        }
    }

}

