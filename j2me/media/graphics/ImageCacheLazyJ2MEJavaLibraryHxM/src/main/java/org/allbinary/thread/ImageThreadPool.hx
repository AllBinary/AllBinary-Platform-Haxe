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

import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.communication.log.LogUtil;

//This is mainly for network communications.
class ImageThreadPool extends ThreadPool {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : ThreadPool = new ImageThreadPool("ImageLoader", 1, ThreadPool.NORMAL_PRIORITY);
    public static function getInstance() : ThreadPool {
        return ImageThreadPool.instance;
    }

    public function new(poolName : String, numThreads : Int, priority : Int) {
        super(poolName, numThreads, priority);
    }

    // synchronized
    public override function runTask(task : Runnable) : Void {
        super.runTask(task);
    }

    public override function startTask(task : Runnable) : Void {
    }

    public override function completedTask(task : Runnable) : Void {
    }

}

