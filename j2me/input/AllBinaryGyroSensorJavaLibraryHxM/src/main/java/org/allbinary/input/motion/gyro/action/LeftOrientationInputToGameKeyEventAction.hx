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
package org.allbinary.input.motion.gyro.action;

import org.allbinary.game.input.PlatformInputMappingFactory;
import org.allbinary.game.input.motion.action.GameKeyCompleteMotionGestureInputEvent;
import org.allbinary.input.gyro.OrientationMotionGestureFactory;
import org.allbinary.logic.NullUtil;

class LeftOrientationInputToGameKeyEventAction extends GameKeyCompleteMotionGestureInputEvent {
    private static var instance : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : GameKeyCompleteMotionGestureInputEvent {
        if (LeftOrientationInputToGameKeyEventAction.instance == NullUtil.getInstance().NULL_OBJECT) {
            LeftOrientationInputToGameKeyEventAction.instance = new LeftOrientationInputToGameKeyEventAction();
        }
        return (cast LeftOrientationInputToGameKeyEventAction.instance : GameKeyCompleteMotionGestureInputEvent);
    }

    public function new() {
        super("Left Action", OrientationMotionGestureFactory.getInstance().LEFT, PlatformInputMappingFactory.getInstance().getPersistentInputMappingInstance().getInputMapping());
    }

}

