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
package org.allbinary.input.automation.module;

import org.allbinary.input.media.image.capture.CaptureWorkerInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.media.image.comparison.ImageComparisonWorker;
import org.allbinary.media.image.comparison.motion.MotionRectanglesWorker;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;
import org.allbinary.thread.RunnableInterface;
import org.allbinary.time.TimeDelayHelper;

class AbstractInputAutomationWorker implements RunnableInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var index : haxe.Int64 = haxe.Int64.ofInt(0);
    private var running : Bool = false;
    private var inputAutomationActionInterface : InputAutomationActionInterface = null;
    private var captureWorkerInterface : CaptureWorkerInterface = null;
    private var imageComparisonWorker : ImageComparisonWorker = null;
    private var motionRectanglesWorker : MotionRectanglesWorker = null;
    private var captureThread : Thread = null;
    public function new(inputAutomationActionInterface : InputAutomationActionInterface) {
    }

    // throws Exception
    public function setThread(thread : Thread) : Void {
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
    public function isAnyDataWorkerRunning() : Bool {
        if (this.captureThread != null && (this.captureThread.isAlive() || this.getCaptureWorker().isRunning() || this.getMotionRectanglesWorker().isRunning() || this.getImageComparisonWorker().isRunning())) {
            return true;
        }
        return false;
    }

    // throws Exception
    // synchronized
    public function startDataWorkers() : Void {
        if (!isAnyDataWorkerRunning()) {
            this.captureThread = new Thread(this.getCaptureWorker());
            this.logUtil.putF("Starting CaptureWorkers - Need more images - Thread State: " + this.captureThread.getState().toString(), this, "startCaptureWorkers");
            this.captureThread.start();
        }
    }

    // throws Exception
    // synchronized
    public function waitForDataWorkers() : Void {
        while (isAnyDataWorkerRunning()) {
            this.logUtil.putF("Waiting", this, this.commonStrings.RUN);
            Sys.sleep(haxe.Int64.toInt(250) / 1000);
        }
    }

    // throws Exception
    public function stopDataWorkers() : Void {
        this.getCaptureWorker().setRunning(false);
    }

    // throws Exception
    public function process() : Void {
        throw new haxe.Exception();
    }

    public function run() : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.RUN);
            this.setRunning(true);
            var timeHelper : TimeDelayHelper = new TimeDelayHelper(1000);
            while (this.isRunning()) {
                timeHelper.setStartTimeTNT();
                this.process();
                this.index++;
                this.logUtil.putF(CommonLabels.getInstance().ELAPSED + timeHelper.getElapsedTNT() + " Index: " + this.index, this, this.commonStrings.RUN);
            }
            this.stopDataWorkers();
            this.waitForDataWorkers();
            this.logUtil.putF(this.commonStrings.END, this, this.commonStrings.RUN);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.RUN, e);
        }
    }

    public function getInputAutomationActionInterface() : InputAutomationActionInterface {
        return this.inputAutomationActionInterface;
    }

    public function setInputAutomationActionInterface(inputAutomationActionInterface : InputAutomationActionInterface) : Void {
        this.inputAutomationActionInterface = inputAutomationActionInterface;
    }

    public function getCaptureWorker() : CaptureWorkerInterface {
        return this.captureWorkerInterface;
    }

    public function setCaptureWorker(captureWorkerInterface : CaptureWorkerInterface) : Void {
        this.captureWorkerInterface = captureWorkerInterface;
    }

    public function getImageComparisonWorker() : ImageComparisonWorker {
        return this.imageComparisonWorker;
    }

    public function setImageComparisonWorker(imageComparisonWorker : ImageComparisonWorker) : Void {
        this.imageComparisonWorker = imageComparisonWorker;
    }

    public function getMotionRectanglesWorker() : MotionRectanglesWorker {
        return this.motionRectanglesWorker;
    }

    public function setMotionRectanglesWorker(motionRectanglesWorker : MotionRectanglesWorker) : Void {
        this.motionRectanglesWorker = motionRectanglesWorker;
    }

}

