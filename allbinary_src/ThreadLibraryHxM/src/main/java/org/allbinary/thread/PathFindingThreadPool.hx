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


//This is mainly for network communications.
class PathFindingThreadPool extends ThreadPool {
    private static final instance : ThreadPool = new PathFindingThreadPool("PathFinding", 1, 1);
    public static function getInstance() : ThreadPool {
        return PathFindingThreadPool.instance;
    }

    public function new(poolName : String, numThreads : Int, priority : Int) {
        super(poolName, numThreads, ThreadPool.NORMAL_PRIORITY);
    }

    public override function runTaskWithPriority(task : PriorityRunnable) : Void {
        super.runTaskWithPriority(task);
    }

    public override function runTask(task : Runnable) : Void {
        super.runTask(task);
    }

    public override function startTask(task : Runnable) : Void {
    }

    public override function completedTask(task : Runnable) : Void {
    }

}

