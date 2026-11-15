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
package org.allbinary.media.image.comparison.motion;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.handler.BasicEventHandler;
import org.allbinary.media.image.comparison.ImageComparisonResult;
import org.allbinary.media.image.comparison.ImageComparisonResultsEvent;
import org.allbinary.media.image.comparison.ImageComparisonResultsListener;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;
import org.allbinary.time.TimeDelayHelper;

class MotionRectanglesWorker extends BasicEventHandler implements ImageComparisonResultsListener {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final imageComparisonInfoVector : BasicArrayList = new BasicArrayListD();
    private final motionRectangleConstraintsInterface : MotionRectangleConstraintsInterface;
    private var index : haxe.Int64 = haxe.Int64.ofInt(0);
    private var running : Bool = false;
    public function new(motionRectangleConstraintsInterface : MotionRectangleConstraintsInterface) {
        super();
        this.motionRectangleConstraintsInterface = motionRectangleConstraintsInterface;
    }

    public function onImageComparisonResultsEvent(imageComparisonResultsEvent : ImageComparisonResultsEvent) : Void {
        this.imageComparisonInfoVector.add(imageComparisonResultsEvent);
        this.run();
    }

    public function onEvent(allBinaryEventObject : AllBinaryEventObject) : Void {
        this.onImageComparisonResultsEvent((cast allBinaryEventObject : ImageComparisonResultsEvent));
    }

    // synchronized
    public function isRunning() : Bool {
        return this.running;
    }

    // synchronized
    public function setRunning(running : Bool) : Void {
        this.running = running;
    }

    public function run() : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.RUN);
            this.setRunning(true);
            final timeHelper : TimeDelayHelper = new TimeDelayHelper(1000);
            timeHelper.setStartTimeTNT();
            final imageComparisonResultsEvent : ImageComparisonResultsEvent = (cast this.imageComparisonInfoVector.get(0) : ImageComparisonResultsEvent);
            final imageComparisonInfo : ImageComparisonResult = (cast imageComparisonResultsEvent.getImageComparisonResult() : ImageComparisonResult);
            this.logUtil.putF(imageComparisonInfo.toString(), this, this.commonStrings.RUN);
            final allMotionRectangles : AllMotionRectangles = new AllMotionRectangles(imageComparisonInfo);
            AllMotionRectanglesResultsCacheSingleton.getInstance().add(new MotionRectanglesResultsFrameCacheable(allMotionRectangles, imageComparisonInfo.getFrameTwo()));
            final consolidatedMotionRectangles : ConsolidateMotionRectangles = new ConsolidateMotionRectangles(allMotionRectangles);
            ConsolidatedMotionRectanglesResultsCacheSingleton.getInstance().add(new MotionRectanglesResultsFrameCacheable(consolidatedMotionRectangles, imageComparisonInfo.getFrameTwo()));
            final constrainedMotionRectangles : ConstrainedMotionRectangles = new ConstrainedMotionRectangles(this.motionRectangleConstraintsInterface, consolidatedMotionRectangles);
            constrainedMotionRectangles.applyMotionRectangleConstraints(consolidatedMotionRectangles);
            ConstrainedMotionRectanglesResultsCacheSingleton.getInstance().add(new MotionRectanglesResultsFrameCacheable(constrainedMotionRectangles, imageComparisonInfo.getFrameTwo()));
            this.fireEvent(new MotionRectanglesResultsEvent(this, imageComparisonInfo.getFrameTwo(), (cast constrainedMotionRectangles : MotionRectangles)));
            this.imageComparisonInfoVector.remove(imageComparisonResultsEvent);
            this.index++;
            this.logUtil.putF(CommonLabels.getInstance().ELAPSED + timeHelper.getElapsedTNT(), this, this.commonStrings.RUN);
            this.setRunning(false);
            this.logUtil.putF(this.commonStrings.END, this, this.commonStrings.RUN);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.RUN, e);
        }
    }

}

