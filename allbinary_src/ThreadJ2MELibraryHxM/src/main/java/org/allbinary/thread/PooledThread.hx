/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;

class PooledThread extends Thread {
    private final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final threadObjectUtil : ThreadObjectUtil = ThreadObjectUtil.getInstance();
    private final threadPool : ThreadPool;
    public function new(threadPool : ThreadPool) {
        super(threadPool.createName());
        this.logUtil.putF(this.commonStrings.CONSTRUCTOR, this, this.commonStrings.CONSTRUCTOR);
        this.threadPool = threadPool;
    }

    private final INTERRUPT_EXCEPTION : String = "Exit InterruptedException";
    public override function run() : Void {
        this.threadPool.threadStarted();
        while (true) {
            var task2 : Runnable = this.threadObjectUtil.NULL_PRIORITY_RUNNABLE;
            try {
                task2 = this.threadPool.getTask();
                this.threadPool.runningTask = true;
                this.threadPool.startTask(task2);
            } catch (ex : InterruptedException) {
                final logUtil : LogUtil = LogUtil.getInstance();
                logUtil.putF(this.INTERRUPT_EXCEPTION, this, this.commonStrings.RUN);
                break;
            }
            if (task2 == this.threadObjectUtil.NULL_PRIORITY_RUNNABLE) {
                break;
            }
            try {
                task2.run();
                this.threadPool.completedTask(task2);
                this.threadPool.runningTask = false;
            } catch (e : haxe.Exception) {
                final logUtil : LogUtil = LogUtil.getInstance();
                logUtil.put(Std.string(new StringMaker().append(this.commonStrings.EXCEPTION_LABEL).append(StringUtil.getInstance().toString(task2))), this, this.commonStrings.RUN, e);
            }
        }
        this.threadPool.threadStopped();
    }

}

