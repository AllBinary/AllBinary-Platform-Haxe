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
package org.allbinary.game.input.motion.action;

import org.allbinary.game.input.CompleteMotionGestureInputEvent;
import org.allbinary.game.input.CompleteMotionGestureInputEventListener;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventStrings;

class NoCompleteMotionGestureInputEventListener extends CompleteMotionGestureInputEventListener {
    private static final instance : NoCompleteMotionGestureInputEventListener = new NoCompleteMotionGestureInputEventListener();
    public function new() {
        super();
    }

    public override function onEvent(eventObject : AllBinaryEventObject) : Void {
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, this);
    }

    public override function onCompleteMotionGestureInputEvent(completeMotionGestureInputEvent : CompleteMotionGestureInputEvent) : Void {
    }

    public static function getInstance() : NoCompleteMotionGestureInputEventListener {
        return NoCompleteMotionGestureInputEventListener.instance;
    }

}

