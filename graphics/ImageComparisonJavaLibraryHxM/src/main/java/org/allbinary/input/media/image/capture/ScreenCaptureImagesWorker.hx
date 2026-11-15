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
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.util.event.handler.BasicEventHandler;
import org.allbinary.media.image.cache.BufferedImageFrameCacheable;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;
import org.allbinary.time.TimeDelayHelper;

class ScreenCaptureImagesWorker extends BasicEventHandler implements CaptureWorkerInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private static var index : haxe.Int64;
    private var running : Bool = false;
    private var screenScavangerRobot : ScreenScavangerRobot;
    public function new() {
        super();
        screenScavangerRobot = new ScreenScavangerRobot();
        ScreenCaptureImagesWorker.index = ProcessingFrameIndexFactory.next();
    }

    // synchronized
    public function isRunning() : Bool {
        return this.running;
    }

    // synchronized
    public function setRunning(running : Bool) : Void {
        this.running = running;
    }

    // throws Exception
    public function setThread(thread : Thread) : Void {
    }

    public function run() : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.RUN);
            this.setRunning(true);
            var timeHelper : TimeDelayHelper = new TimeDelayHelper(1000);
            while (isRunning()) {
                timeHelper.setStartTimeTNT();
                var bufferedImage : BufferedImage = this.screenScavangerRobot.getScreenAsBufferedImages()[0];
                var frame : Null<haxe.Int64> = index;
                ScreenCaptureImagesWorker.index++;
                CapturedBufferedImagesCacheSingleton.getInstance().add(new BufferedImageFrameCacheable(bufferedImage, frame));
                var capturedImageEvent : CapturedImageWorkerResultsEvent = new CapturedImageWorkerResultsEvent(this, frame, bufferedImage);
                fireEvent(capturedImageEvent);
                this.logUtil.putF(CommonLabels.getInstance().ELAPSED + timeHelper.getElapsedTNT(), this, this.commonStrings.RUN);
                this.setRunning(false);
            }
            this.logUtil.putF(this.commonStrings.END, this, this.commonStrings.RUN);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.RUN, e);
        }
    }

}

