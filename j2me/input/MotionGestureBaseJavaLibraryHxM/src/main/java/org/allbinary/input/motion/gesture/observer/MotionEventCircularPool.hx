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
package org.allbinary.input.motion.gesture.observer;

import org.allbinary.game.input.InputFactory;
import org.allbinary.input.motion.gesture.MotionGestureInput;
import org.allbinary.input.motion.gesture.TouchMotionGestureFactory;
import org.allbinary.logic.util.event.AllBinaryEventCircularPool;

class MotionEventCircularPool {
    public static function createPool(id : Int) : MotionEventCircularPool {
        return new MotionEventCircularPool(id);
    }

    private final MIN : Int = TouchMotionGestureFactory.getInstance().LAST_MOTION.getId();
    private var eventPool : AllBinaryEventCircularPool = new AllBinaryEventCircularPool((InputFactory.getInstance().MAX - 1) - this.MIN);
    public function new(id : Int) {
        this.eventPool.initAllBinaryEventCircularPool(new MotionEventFactory(this.eventPool, id));
    }

    // throws Exception
    // synchronized
    public function getInstance(motionGestureInput : MotionGestureInput) : MotionGestureEvent {
        return (cast this.eventPool.getInstance(motionGestureInput.getId() - this.MIN) : MotionGestureEvent);
    }

}

