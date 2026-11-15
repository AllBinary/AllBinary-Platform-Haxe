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
package org.allbinary.input.motion;

import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.string.CommonStrings;

class CompleteMotionGestureInputToGameMotionGestureInput {
    private static final instance : CompleteMotionGestureInputToGameMotionGestureInput = new CompleteMotionGestureInputToGameMotionGestureInput();
    public static function getInstance() : CompleteMotionGestureInputToGameMotionGestureInput {
        return CompleteMotionGestureInputToGameMotionGestureInput.instance;
    }

    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public function init() : Void {
        PreLogUtil.put("No Touch Button = No Compound Motion Gestures", this, this.commonStrings.INIT);
    }

    public function new() {
    }
}

