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

//import javax.microedition.lcdui.Command;
//import javax.microedition.lcdui.CommandListener;
import org.allbinary.graphics.displayable.MyCanvas;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class CommandRunnable implements Runnable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final commandFormInputProcessor : CommandFormInputProcessor;
    private final command : Command;
    public function new(commandFormInputProcessor : CommandFormInputProcessor, command : Command) {
        this.commandFormInputProcessor = commandFormInputProcessor;
        this.command = command;
    }

    public function run() : Void {
        try {
            this.logUtil.putF(this.commonStrings.START_RUNNABLE, this, this.commonStrings.RUN);
            final canvas : MyCanvas = this.commandFormInputProcessor.getCanvas();
            final commandListener : CommandListener = canvas.getCustomCommandListener();
            commandListener.commandAction(this.command, canvas);
            this.logUtil.putF(this.commonStrings.END_RUNNABLE, this, this.commonStrings.RUN);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.RUN, e);
        }
    }

}

