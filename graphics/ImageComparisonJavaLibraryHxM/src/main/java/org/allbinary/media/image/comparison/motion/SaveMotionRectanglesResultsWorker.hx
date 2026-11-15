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
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;
import org.allbinary.time.TimeDelayHelper;

class SaveMotionRectanglesResultsWorker implements MotionRectanglesResultsListener {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var running : Bool = false;
    private var motionRectanglesVector : BasicArrayList;
    public function new() {
        this.motionRectanglesVector = new BasicArrayListD();
    }

    public function getMotionRectanglesVector() : BasicArrayList {
        return this.motionRectanglesVector;
    }

    public function onMotionRectanglesImageComparisonResultsEvent(motionRectanglesResultsEvent : MotionRectanglesResultsEvent) : Void {
        this.getMotionRectanglesVector().add(motionRectanglesResultsEvent);
        this.run();
    }

    public function onEvent(allBinaryEventObject : AllBinaryEventObject) : Void {
        this.onMotionRectanglesImageComparisonResultsEvent((cast allBinaryEventObject : MotionRectanglesResultsEvent));
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
            var timeHelper : TimeDelayHelper = new TimeDelayHelper(1000);
            timeHelper.setStartTimeTNT();
            var motionRectanglesResultsEvent : MotionRectanglesResultsEvent = (cast this.getMotionRectanglesVector().get(0) : MotionRectanglesResultsEvent);
            var motionRectangles : MotionRectangles = motionRectanglesResultsEvent.getMotionRectangles();
            new MotionRectanglesImageInputOutput().save(motionRectangles, motionRectanglesResultsEvent.getFrame());
            this.getMotionRectanglesVector().remove(motionRectangles);
            this.logUtil.putF(CommonLabels.getInstance().ELAPSED + timeHelper.getElapsedTNT(), this, this.commonStrings.RUN);
            this.logUtil.putF(this.commonStrings.END, this, this.commonStrings.RUN);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.RUN, e);
        }
    }

}

