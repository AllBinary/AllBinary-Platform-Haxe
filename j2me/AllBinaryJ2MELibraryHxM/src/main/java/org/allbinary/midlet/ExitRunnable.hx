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
package org.allbinary.midlet;

//import javax.microedition.lcdui.NullCanvas;
import org.allbinary.canvas.Processor;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class ExitRunnable implements Runnable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final midlet : AllBinaryMidlet;
    private final processor : Processor;
    private final isProgress : Bool;
    public function new(midlet : AllBinaryMidlet, processor : Processor, isProgress : Bool) {
        this.midlet = midlet;
        this.isProgress = isProgress;
        this.processor = processor;
    }

    public function run() : Void {
        try {
            this.logUtil.putF(this.commonStrings.START_RUNNABLE, this, this.commonStrings.RUN);
            this.midlet.destroyAppInRunnable(false, this.isProgress);
            this.midlet.setDisplay(NullCanvas.NULL_CANVAS);
            this.midlet.notifyDestroyed();
            this.logUtil.putF(this.commonStrings.END_RUNNABLE, this, this.commonStrings.RUN);
            this.processor.process();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.RUN, e);
            try {
                this.processor.process();
            } catch (e2 : haxe.Exception) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.RUN, e);
            }
        }
    }

}

