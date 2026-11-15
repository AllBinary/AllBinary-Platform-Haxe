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
package org.allbinary.input.motion.gesture;

import org.allbinary.game.input.CompleteMotionGestureInputEvent;
import org.allbinary.util.BasicArrayList;

class MotionGestureToMotionGestureActionAssociation {
    private var list : BasicArrayList;
    private var motionGestureAction : CompleteMotionGestureInputEvent;
    public function new(list : BasicArrayList, commandAction : CompleteMotionGestureInputEvent) {
        this.list = list;
        this.motionGestureAction = commandAction;
    }

    public function getMotionGesture() : BasicArrayList {
        return this.list;
    }

    public function setMotionGestures(list : BasicArrayList) : Void {
        this.list = list;
    }

    public function getCommandAction() : CompleteMotionGestureInputEvent {
        return this.motionGestureAction;
    }

    public function setMotionGestureAction(commandAction : CompleteMotionGestureInputEvent) : Void {
        this.motionGestureAction = commandAction;
    }

    public function isMotionGestureArrayEquals(aList : BasicArrayList) : Bool {
        var size : Int = aList.size();
        if (this.list.size() != size) {
            return false;
        }
        {
            var i : Int = size - 1;
            while (i >= 0) {
            if (aList.objectArray[i] != this.list.objectArray[i]) {
                return false;
            }
                i--;
            }
        }
        return true;
    }

}

