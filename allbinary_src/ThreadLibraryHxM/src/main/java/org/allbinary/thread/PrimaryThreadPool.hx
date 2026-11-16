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

import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;

class PrimaryThreadPool extends ThreadPool {
    private static final THREAD_POOL : ThreadPool = new ThreadPool("Primary", 1, ThreadPool.NORMAL_PRIORITY);
    public static function getInstance() : ThreadPool {
        return PrimaryThreadPool.THREAD_POOL;
    }

    public function new(poolName : String, numThreads : Int, priority : Int) {
        super(poolName, numThreads, priority);
    }

    public override function runTask(task : Runnable) : Void {
        this.logUtil.putF(Std.string(new StringMaker().append(StringUtil.getInstance().toString(task)).appendlong(haxe.Int64.fromFloat(Date.now().getTime()))), this, this.threadPoolStrings.ADD_TASK);
        super.runTask(task);
    }

    public override function startTask(task : Runnable) : Void {
        this.logUtil.putF(Std.string(new StringMaker().append(this.threadPoolStrings.START_TASK).append(StringUtil.getInstance().toString(task))), this, this.commonStrings.RUN);
    }

    public override function completedTask(task : Runnable) : Void {
        this.logUtil.putF(Std.string(new StringMaker().append(this.threadPoolStrings.COMPLETE_TASK).append(StringUtil.getInstance().toString(task))), this, this.commonStrings.RUN);
    }

}

