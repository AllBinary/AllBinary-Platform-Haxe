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


class SoundThreadPool {
    private static final instance : ThreadPool = new ThreadPool("Sound", 1, ThreadPool.NORMAL_PRIORITY);
    public static function getInstance() : ThreadPool {
        return SoundThreadPool.instance;
    }

    public function new() {
    }
}

