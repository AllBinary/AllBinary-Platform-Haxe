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
package org.allbinary.game.input;

import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventListenerInterface;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.logic.util.event.handler.BasicEventHandler;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class CompleteMotionGestureInputEventHandler extends BasicEventHandler {
    private static final SINGLETON : CompleteMotionGestureInputEventHandler = new CompleteMotionGestureInputEventHandler();
    public static function getInstance() : CompleteMotionGestureInputEventHandler {
        return CompleteMotionGestureInputEventHandler.SINGLETON;
    }

    private final list : BasicArrayList = new BasicArrayListD();
    public function new() {
        super();
    }

    public function addListener(completeMotionGestureInputEventListener : CompleteMotionGestureInputEventListener) : Void {
        if (!this.list.contains(completeMotionGestureInputEventListener)) {
            this.list.add(completeMotionGestureInputEventListener);
        }
    }

    public override function removeAllListeners() : Void {
        this.list.clear();
        super.removeAllListeners();
    }

    public override function removeListener(eventListenerInterface : EventListenerInterface) : Void {
        this.list.remove(eventListenerInterface);
        super.removeListener(eventListenerInterface);
    }

    // throws Exception
    public override function fireEvent_AllBinaryEventObject(eventObject : AllBinaryEventObject) : Void {
        {
            var index : Int = this.list.size();
            while (--index >= 0) {
            try {
                var completeMotionGestureInputEventListener : CompleteMotionGestureInputEventListener = (cast this.list.objectArray[index] : CompleteMotionGestureInputEventListener);
                completeMotionGestureInputEventListener.onCompleteMotionGestureInputEvent((cast eventObject : CompleteMotionGestureInputEvent));
            } catch (e : haxe.Exception) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, EventStrings.getInstance().FIRE_EVENT, e);
            }
            }
        }
        super.fireEvent(eventObject);
    }

    // throws Exception
    public override function process(eventObject : AllBinaryEventObject, eventListenerInterface : EventListenerInterface) : Void {
        final completeMotionGestureInputEventListenerInterface : CompleteMotionGestureInputEventListenerInterface = (cast eventListenerInterface : CompleteMotionGestureInputEventListenerInterface);
        completeMotionGestureInputEventListenerInterface.onCompleteMotionGestureInputEvent((cast eventObject : CompleteMotionGestureInputEvent));
    }

}

