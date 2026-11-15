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
package org.allbinary.input.gyro;

import org.allbinary.game.input.CompleteMotionGestureInputEventListenerInterface;
import org.allbinary.game.input.motion.action.NoCompleteMotionGestureInputEventListener;
import org.allbinary.input.AllBinarySensor;
import org.allbinary.logic.math.Orientation;

class AllBinaryOrientationSensor extends AllBinarySensor {
    public static final NULL_ALLBINARY_ORIENTATION_SENSOR : AllBinaryOrientationSensor = new AllBinaryOrientationSensor();
    private var listener : CompleteMotionGestureInputEventListenerInterface = NoCompleteMotionGestureInputEventListener.getInstance();
    public function setListener(completeMotionGestureInputEventListenerInterface : CompleteMotionGestureInputEventListenerInterface) : Void {
        this.listener = completeMotionGestureInputEventListenerInterface;
    }

    public function new() {
        super();
    }

    // throws Exception
    public function getOrientation() : Orientation {
        throw new haxe.Exception(this.commonStrings.NOT_IMPLEMENTED);
    }

}

