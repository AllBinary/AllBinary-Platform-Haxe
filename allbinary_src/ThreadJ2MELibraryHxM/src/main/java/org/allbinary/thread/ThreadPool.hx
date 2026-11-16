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
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.util.BasicArrayListUtil;

class ThreadPool {
    private static final ROOT_NAME : String = "-PooledThread-";
    public static final NORMAL_PRIORITY : Int = Thread.NORM_PRIORITY;
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final NULL_RUNNABLE : NullRunnable = NullRunnable.getInstance();
    public final threadPoolStrings : ThreadPoolStrings = ThreadPoolStrings.getInstance();
    public final threadObjectUtil : ThreadObjectUtil = ThreadObjectUtil.getInstance();
    private final poolName : String;
    private final priority : Int;
    private var isAlive : Bool = false;
    private var taskQueue : BasicArrayList = BasicArrayListUtil.getInstance().getImmutableInstance();
    private var threadID : Int = 0;
    private var numThreads : Int;
    public var runningTask : Bool = false;
    public function new(poolName : String, numThreads : Int, priority : Int) {
        this.poolName = poolName;
        this.priority = priority;
        this.numThreads = numThreads;
    }

    public function init() : Void {
        if (!this.isAlive) {
            this.isAlive = true;
            this.taskQueue = new BasicArrayListD();
            var pooledThread : PooledThread = null;
            for (i in 0...this.numThreads) {
                pooledThread = new PooledThread(this);
                pooledThread.setPriority(this.priority);
                pooledThread.start();
            }
        }
    }

    // throws Exception
    public function runAPriorityTask() : Void {
        throw new jre.lang.JavaException();
    }

    public function runTaskWithPriority(task : PriorityRunnable) : Void {
        // synchronized (this)
        {
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
                jre.lang.JavaObject.notify(this);
            }
        }
    }

    public function runTask(task : Runnable) : Void {
        // synchronized (this)
        {
            if (!this.isAlive) {
                this.init();
            }
            if (task != null) {
                this.taskQueue.add(task);
                jre.lang.JavaObject.notify(this);
            }
        }
    }

    // throws InterruptedException
    public function getTask() : Runnable {
        // synchronized (this)
        {
            while (this.taskQueue.size() == 0) {
                if (!this.isAlive) {
                    return this.NULL_RUNNABLE;
                }
                jre.lang.JavaObject.wait(this);
            }
            final runnable : Runnable = (cast this.taskQueue.removeAt(0) : Runnable);
            return runnable;
        }
    }

    public function clear() : Void {
        // synchronized (this)
        {
            if (this.isAlive) {
                this.taskQueue.clear();
            }
        }
    }

    public function close() : Void {
        // synchronized (this)
        {
            if (this.isAlive) {
                this.isAlive = false;
                this.taskQueue.clear();
            }
        }
    }

    public function join() : Void {
        // synchronized (this)
        {
            this.isAlive = false;
            this.taskQueue.clear();
            jre.lang.JavaObject.notifyAll(this);
        }
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
        }
    }

    public function startTask(task : Runnable) : Void {
    }

    public function completedTask(task : Runnable) : Void {
    }

    public function createName() : String {
        return Std.string(new StringMaker().append(this.poolName).append(ThreadPool.ROOT_NAME).appendint(this.threadID++));
    }

}

