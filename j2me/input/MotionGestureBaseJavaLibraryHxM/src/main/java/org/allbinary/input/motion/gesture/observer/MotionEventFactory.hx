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

import org.allbinary.game.input.Input;
import org.allbinary.game.input.InputFactory;
import org.allbinary.input.motion.gesture.MotionGestureInput;
import org.allbinary.input.motion.gesture.TouchMotionGestureFactory;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.AllBinaryEventObjectFactoryInterface;

class MotionEventFactory implements AllBinaryEventObjectFactoryInterface {
    private static var index : Int = 0;
    private final source : Any;
    private final id : Int;
    public function new(source : Any, id : Int) {
        this.source = source;
        this.id = id;
        MotionEventFactory.index = TouchMotionGestureFactory.getInstance().LAST_MOTION.getId();
    }

    public function getInstance() : AllBinaryEventObject {
        final inputFactory : InputFactory = InputFactory.getInstance();
        final input : Input = inputFactory.getInstanceById(MotionEventFactory.index++);
        if (input == inputFactory.NO_INPUT) {
            return new MotionGestureEvent(this.source, this.id, (cast TouchMotionGestureFactory.getInstance().NO_MOTION : MotionGestureInput));
        } else {
            return new MotionGestureEvent(this.source, this.id, (cast input : MotionGestureInput));
        }
    }

}

