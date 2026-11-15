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
package org.allbinary.media.image.comparison;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.input.media.image.capture.CapturedImageWorkerResultsEvent;
import org.allbinary.input.media.image.capture.CapturedImageWorkerResultsListener;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.handler.BasicEventHandler;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;
import org.allbinary.time.TimeDelayHelper;

class ImageComparisonWorker extends BasicEventHandler implements CapturedImageWorkerResultsListener {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final bufferedImageVector : BasicArrayList = new BasicArrayListD();
    private final imageComparatorConstraintsInterface : ImageComparatorConstraintsInterface;
    private final imageComparator : ImageComparator;
    private var running : Bool = false;
    private var index2 : Int = 0;
    public function new(imageComparatorConstraintsInterface : ImageComparatorConstraintsInterface) {
        super();
        this.imageComparatorConstraintsInterface = imageComparatorConstraintsInterface;
        this.imageComparator = new ImageComparator(imageComparatorConstraintsInterface);
    }

    // synchronized
    public function isRunning() : Bool {
        return this.running;
    }

    // synchronized
    public function setRunning(running : Bool) : Void {
        this.running = running;
    }

    // synchronized
    public function onCaptureEvent(capturedImageWorkerResultsEvent : CapturedImageWorkerResultsEvent) : Void {
        this.bufferedImageVector.add(capturedImageWorkerResultsEvent);
        if (this.bufferedImageVector.size() > 1) {
            this.run();
        }
    }

    // synchronized
    public function onEvent(allBinaryEventObject : AllBinaryEventObject) : Void {
        this.onCaptureEvent((cast allBinaryEventObject : CapturedImageWorkerResultsEvent));
    }

    public function run() : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.RUN);
            this.setRunning(true);
            var timeHelper : TimeDelayHelper = new TimeDelayHelper(1000);
            timeHelper.setStartTimeTNT();
            if (this.imageComparatorConstraintsInterface.isFrameAllowed(this.index2)) {
                final capturedImageWorkerResultsEvent : haxe.ds.Vector<CapturedImageWorkerResultsEvent> = haxe.ds.Vector.fromArrayCopy([for (index in 0...2) null]);
                capturedImageWorkerResultsEvent[0] = (cast this.bufferedImageVector.get(0) : CapturedImageWorkerResultsEvent);
                capturedImageWorkerResultsEvent[1] = (cast this.bufferedImageVector.get(1) : CapturedImageWorkerResultsEvent);
                if (this.imageComparatorConstraintsInterface.isImageValid(capturedImageWorkerResultsEvent[0].getBufferedImage()) && this.imageComparatorConstraintsInterface.isImageValid(capturedImageWorkerResultsEvent[1].getBufferedImage())) {
                    final imageComparisonResult : ImageComparisonResult = this.imageComparator.compare(capturedImageWorkerResultsEvent[0].getBufferedImage(), capturedImageWorkerResultsEvent[1].getBufferedImage(), capturedImageWorkerResultsEvent[0].getFrame(), capturedImageWorkerResultsEvent[1].getFrame(), 0);
                    final frame : Null<haxe.Int64> = capturedImageWorkerResultsEvent[1].getFrame();
                    final imageComparisonResultFrameCacheable : ImageComparisonResultFrameCacheable = new ImageComparisonResultFrameCacheable(imageComparisonResult, frame);
                    ImageComparisonResultCacheSingleton.getInstance().add(imageComparisonResultFrameCacheable);
                    this.fireEvent(new ImageComparisonResultsEvent(this, imageComparisonResult));
                    this.logUtil.putF(new StringMaker().append("Image Comparison Result: ").append(imageComparisonResult.toString()).append(" for frame: ").appendlong(frame).toString(), this, this.commonStrings.RUN);
                } else {
                    this.logUtil.putF("An Image Was Not Valid: Image Worker Event Processing terminated", this, this.commonStrings.RUN);
                }
            }
            this.bufferedImageVector.remove(0);
            this.index2++;
            final message : String = new StringMaker().append("Frame: ").appendint(this.index2).append(CommonLabels.getInstance().ELAPSED).appendlong(haxe.Int64.ofInt(timeHelper.getElapsedTNT())).toString();
            this.logUtil.putF(message, this, this.commonStrings.RUN);
            this.setRunning(false);
            this.logUtil.putF(this.commonStrings.END, this, this.commonStrings.RUN);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.RUN, e);
        }
    }

}

