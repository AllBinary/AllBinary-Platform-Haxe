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
package org.allbinary.canvas;

import javax.microedition.lcdui.CommandListener;
import org.allbinary.TsUtil;
import org.allbinary.game.displayable.canvas.NullWaitGameRunnable;
import org.allbinary.graphics.displayable.MyCanvas;
import org.allbinary.logic.ABSystemWrapper;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;
import org.allbinary.thread.NullThread;
import org.allbinary.thread.RunnableInterface;
import org.allbinary.thread.ThreadObjectUtil;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.BasicArrayList;

class RunnableCanvas extends MyCanvas implements RunnableInterface {
    public final nullUtil : NullUtil = NullUtil.getInstance();
    public final stdUtil : StdUtil = StdUtil.getInstance();
    public final systemWrapper : ABSystemWrapper = ABSystemWrapper.getInstance();
    public final tsUtil : TsUtil = TsUtil.getInstance();
    private var thread : Thread = NullThread.NULL_THREAD;
    private var currentThread : Thread = NullThread.NULL_THREAD;
    private var running : Bool = false;
    public final loopTimeHelper : TimeDelayHelper = new TimeDelayHelper(NullWaitGameRunnable.getInstance().WAIT);
    public var runnableCanvasRefreshHelper : Processor = Processor.getInstance();
    public final commonLabels : CommonLabels = CommonLabels.getInstance();
    public final threadObjectUtil : ThreadObjectUtil = ThreadObjectUtil.getInstance();
    public final SET_RUNNING : String = "setRunning";
    private final IS_RUNNING : String = "isRunning";
    private final THREAD : String = "Thread: ";
    private final NOT_EQUAL : String = " != ";
    private final PAUSE_SLEEP : String = "pause sleep";
    private final START_PAUSE : String = "start pause - game thread sleep at: ";
    private final END_PAUSE : String = "end pause - game thread sleep at: ";
    private final PROCESS_LOOP_SLEEP : String = "processLoopSleep";
    public function new(commandListener : CommandListener, childNameList : BasicArrayList, hasParam : Bool) {
        super(CommonStrings.getInstance().UNKNOWN, childNameList);
        this.logUtil.putF(Std.string(new StringMaker().append("RunnableCanvas delay: ").appendint(Std.int(this.loopTimeHelper.delay))), this, this.commonStrings.CONSTRUCTOR);
        this.runnableCanvasRefreshHelper = new RunnableCanvasRefreshHelper(this);
        if (commandListener != null) {
            this.initCommands(commandListener);
        } else if (hasParam) {
            this.logUtil.putF("commandListener was null", this, "initCommands");
        }
    }

    public function initCommands(cmdListener : CommandListener) : Void {
        this.logUtil.putF(this.commonStrings.NOT_IMPLEMENTED, this, "initCommands");
    }

    public function isMainCanvas() : Bool {
        if (this.getCustomCommandListener() != null) {
            return true;
        } else {
            return false;
        }
    }

    public override function setThread(thread : Thread) : Void {
        this.thread = thread;
    }

    public override function setRunning(running : Bool) : Void {
        this.running = running;
        if (!this.running) {
            this.thread = NullThread.NULL_THREAD;
            // synchronized (this)
            {
                this.threadObjectUtil.notifyObject(this);
            }
        }
        this.logUtil.putF(Std.string(new StringMaker().append(this.IS_RUNNING).appendboolean(this.running)), this, this.SET_RUNNING);
    }

    // synchronized
    public override function isRunning() : Bool {
        if (this.thread == this.currentThread) {
            return this.running;
        } else {
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(this.THREAD);
            if (this.thread != null) {
                stringBuffer.append(Std.string(this.thread));
            }
            stringBuffer.append(this.NOT_EQUAL);
            if (this.currentThread != null) {
                stringBuffer.append(StringUtil.getInstance().toString(this.currentThread));
            }
            this.logUtil.putF(Std.string(stringBuffer), this, this.IS_RUNNING);
            return false;
        }
    }

    public function getLoopTimeHelperP() : TimeDelayHelper {
        return this.loopTimeHelper;
    }

    private var pauseWait : haxe.Int64 = 0;
    public function setWait(wait : Int) : Void {
        this.loopTimeHelper.delay = wait;
        this.pauseWait = haxe.Int64.ofInt(wait) * 3;
        this.logUtil.putF(Std.string(new StringMaker().append("setWait - delay: ").appendint(Std.int(this.loopTimeHelper.delay))), this, this.commonStrings.CONSTRUCTOR);
    }

    public function getWait() : Int {
        return this.loopTimeHelper.delay;
    }

    public function setCurrentThread() : Void {
        this.currentThread = Thread.currentThread();
    }

    public function setCurrentThreadFake() : Void {
        this.currentThread = this.thread;
    }

    public override function showNotify() : Void {
        try {
            this.stopWaiting();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "showNotify", e);
        }
    }

    private var notified : Bool = false;
    // throws Exception
    private function stopWaiting() : Void {
        this.notified = true;
        // synchronized (this)
        {
            this.threadObjectUtil.notifyObject(this);
        }
        this.repaint();
    }

    // throws Exception
    // synchronized
    public function waitOnNotify(wait : haxe.Int64) : Void {
        if (!this.notified) {
            if (wait > 0) {
                this.threadObjectUtil.waitObjectFor(this, wait);
            } else {
                this.threadObjectUtil.waitObject(this);
            }
        }
    }

    // throws Exception
    public function processSleep() : Void {
        Sys.sleep(haxe.Int64.toInt(this.pauseWait) / 1000);
    }

    public function isPausable() : Bool {
        return false;
    }

    // throws Exception
    public function processGameSleep(sleep : haxe.Int64) : Void {
        Sys.sleep(haxe.Int64.toInt(sleep) / 1000);
    }

    // throws Exception
    public function processLoopSleep() : Void {
        this.runnableCanvasRefreshHelper.process();
        if (this.isPaused()) {
            final stringMaker : StringMaker = new StringMaker();
            if (this.isRunning() && !this.isSingleThread()) {
                stringMaker.delete(0, stringMaker.length());
                final currentTimeMillis : haxe.Int64 = this.systemWrapper.currentTimeMillis();
                this.logUtil.putF(Std.string(stringMaker.append(this.START_PAUSE).appendlong(currentTimeMillis).append(this.PAUSE_SLEEP).appendlong(this.pauseWait)), this, this.PROCESS_LOOP_SLEEP);
                while (this.isPaused() && this.isRunning() && !this.isSingleThread()) {
                    this.processSleep();
                    if (!this.isPausable()) {
                        stringMaker.delete(0, stringMaker.length());
                        this.logUtil.putF(Std.string(stringMaker.append(this.END_PAUSE).appendlong(currentTimeMillis)), this, this.PROCESS_LOOP_SLEEP);
                        return;
                    }
                }
            }
        }
        var elapsedTime : haxe.Int64 = this.loopTimeHelper.getElapsedTNT();
        final wait : haxe.Int64 = haxe.Int64.ofInt(this.loopTimeHelper.delay);
        if (elapsedTime > wait) {
            elapsedTime = wait;
        } else {
            this.processGameSleep(wait - elapsedTime);
        }
    }

    public function isSingleThread() : Bool {
        return false;
    }

    public override function run() : Void {
        this.setCurrentThread();
    }

    // throws Exception
    public function end2() : Void {
    }

    public function getType() : Int {
        return -1;
    }

}

