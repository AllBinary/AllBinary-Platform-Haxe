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
package org.allbinary.input.media.image.capture;

//import java.awt.image.BufferedImage;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.handler.BasicEventHandler;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;
import org.allbinary.time.TimeDelayHelper;

class SaveCapturedImageWorker extends BasicEventHandler implements CapturedImageWorkerResultsListener {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var running : Bool = false;
    private var capturedImageWorkerResultsEventVector : BasicArrayList = new BasicArrayListD();
    public function new() {
        super();
    }

    // synchronized
    public function isRunning() : Bool {
        return this.running;
    }

    // synchronized
    public function setRunning(running : Bool) : Void {
        this.running = running;
    }

    public function onCaptureEvent(capturedImageEvent : CapturedImageWorkerResultsEvent) : Void {
        this.capturedImageWorkerResultsEventVector.add(capturedImageEvent);
        this.run();
    }

    public function onEvent(allBinaryEventObject : AllBinaryEventObject) : Void {
        this.onCaptureEvent((cast allBinaryEventObject : CapturedImageWorkerResultsEvent));
    }

    public function run() : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.RUN);
            this.setRunning(true);
            var timeHelper : TimeDelayHelper = new TimeDelayHelper(1000);
            timeHelper.setStartTimeTNT();
            var capturedImageWorkerResultsEvent : CapturedImageWorkerResultsEvent = ((cast this.capturedImageWorkerResultsEventVector.get(0) : CapturedImageWorkerResultsEvent));
            var screenBufferedImage : BufferedImage = capturedImageWorkerResultsEvent.getBufferedImage();
            new CapturedImageInputOutput().save(screenBufferedImage, capturedImageWorkerResultsEvent.getFrame());
            this.capturedImageWorkerResultsEventVector.remove(capturedImageWorkerResultsEvent);
            this.logUtil.putF(CommonLabels.getInstance().ELAPSED + timeHelper.getElapsedTNT(), this, this.commonStrings.RUN);
            this.setRunning(false);
            this.logUtil.putF(this.commonStrings.END, this, this.commonStrings.RUN);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.RUN, e);
        }
    }

}

