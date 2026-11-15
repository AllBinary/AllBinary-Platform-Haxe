/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2009 AllBinary
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
package org.allbinary.android.input.motion;


class NoMotionEventProcessor extends MotionEventProcessor {
    public static final SINGLETON : MotionEventProcessor = new MotionEventProcessor();
    public static function getInstance() : MotionEventProcessor {
        return NoMotionEventProcessor.SINGLETON;
    }

    public function new() {
        super();
    }
}

