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
package org.allbinary.thread;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class ThreadPool {
    public static final NORMAL_PRIORITY : Int = 5;
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final NULL_RUNNABLE : NullRunnable = NullRunnable.getInstance();
    public final threadPoolStrings : ThreadPoolStrings = ThreadPoolStrings.getInstance();
    public final threadObjectUtil : ThreadObjectUtil = ThreadObjectUtil.getInstance();
    private var isAlive : Bool = false;
    private var taskQueue : BasicArrayList = new BasicArrayListD();
    private var numThreads : Int = 0;
    private var runningTask : Bool = false;
    public function new(poolName : String, numThreads : Int, priority : Int) {
        this.currentPriorityRunnable = this.threadObjectUtil.NULL_PRIORITY_RUNNABLE;
    }

    private var currentPriorityRunnable : PriorityRunnable;
    // throws Exception
    public function runAPriorityTask() : Void {
        if (!this.currentPriorityRunnable.isDone()) {
            this.currentPriorityRunnable.run();
        } else {
            final runnable : Runnable = this.getTask();
            if (runnable == this.NULL_RUNNABLE) {
                return;
            }
            this.currentPriorityRunnable = (cast runnable : PriorityRunnable);
            if (!(this.currentPriorityRunnable == this.threadObjectUtil.NULL_PRIORITY_RUNNABLE)) {
                this.currentPriorityRunnable.reset();
                this.currentPriorityRunnable.run();
            }
        }
    }

    // throws Exception
    public function runATask() : Void {
        var runnable : Runnable = this.getTask();
        if (runnable != null) {
            runnable.run();
        }
    }

    public function init() : Void {
        if (!this.isAlive) {
            this.isAlive = true;
            this.taskQueue = new BasicArrayListD();
        }
    }

    // synchronized
    public function runTaskWithPriority(task : PriorityRunnable) : Void {
        if (!this.isAlive) {
            this.init();
        }
        if (task != null) {
            final size : Int = this.taskQueue.size();
            var runnable : PriorityRunnable = null;
            var lowerPriorityRunnable : PriorityRunnable = this.threadObjectUtil.NULL_PRIORITY_RUNNABLE;
            for (index in 0...size) {
                runnable = (cast this.taskQueue.get(index) : PriorityRunnable);
                if (runnable.getPriority() > task.getPriority()) {
                    lowerPriorityRunnable = runnable;
                    break;
                }
            }
            if (lowerPriorityRunnable == this.threadObjectUtil.NULL_PRIORITY_RUNNABLE) {
                this.taskQueue.add(task);
            } else {
                final index : Int = this.taskQueue.indexOf(lowerPriorityRunnable);
                this.taskQueue.addAt(index, task);
            }
        }
    }

    // synchronized
    public function runTask(task : Runnable) : Void {
        if (!this.isAlive) {
            this.init();
        }
        if (task != null) {
            this.taskQueue.add(task);
        }
    }

    // throws InterruptedException
    // synchronized
    public function getTask() : Runnable {
        if (this.taskQueue.isEmpty()) {
            return this.NULL_RUNNABLE;
        }
        return (cast this.taskQueue.removeAt(0) : Runnable);
    }

    // synchronized
    public function clear() : Void {
        this.taskQueue.clear();
    }

    // synchronized
    public function close() : Void {
        if (this.isAlive) {
            this.isAlive = false;
            this.taskQueue.clear();
            this.currentPriorityRunnable = this.threadObjectUtil.NULL_PRIORITY_RUNNABLE;
        }
    }

    public function join() : Void {
        this.isAlive = false;
        this.taskQueue.clear();
        this.currentPriorityRunnable = this.threadObjectUtil.NULL_PRIORITY_RUNNABLE;
    }

    public function isBusy() : Bool {
        if (!this.isAlive) {
            return false;
        }
        if (this.taskQueue.size() > 0) {
            return true;
        }
        if (this.runningTask) {
            return true;
        }
        return false;
    }

    public function threadStarted() : Void {
    }

    public function threadStopped() : Void {
        if (this.numThreads == 1) {
            this.isAlive = false;
            this.taskQueue.clear();
            this.currentPriorityRunnable = this.threadObjectUtil.NULL_PRIORITY_RUNNABLE;
        }
    }

    public function startTask(task : Runnable) : Void {
    }

    public function completedTask(task : Runnable) : Void {
    }

}

