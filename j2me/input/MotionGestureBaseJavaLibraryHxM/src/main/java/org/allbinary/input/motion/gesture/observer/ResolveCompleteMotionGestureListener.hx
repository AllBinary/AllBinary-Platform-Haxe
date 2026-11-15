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

import org.allbinary.game.input.CompleteMotionGestureInputEventHandler;
import org.allbinary.game.input.motion.action.GameKeyCompleteMotionGestureInputEvent;
import org.allbinary.game.input.motion.action.GameKeyFromMotionGestureEventListener;
import org.allbinary.input.motion.gesture.MotionGestureToMotionGestureActionAssociation;
import org.allbinary.input.motion.gesture.configuration.MotionGestureConfiguration;
import org.allbinary.input.motion.gesture.configuration.MotionGestureConfigurationFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;

class ResolveCompleteMotionGestureListener implements CompleteMotionGestureListenerInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new() {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        this.logUtil.putF("MotionGesture to CompleteMotionGesture Reciever", this, commonStrings.CONSTRUCTOR);
        CompleteMotionGestureInputEventHandler.getInstance().addListener(new GameKeyFromMotionGestureEventListener());
    }

    // throws Exception
    public function onMotionGestureCompleted(list : BasicArrayList) : Void {
        var configuration : MotionGestureConfiguration = MotionGestureConfigurationFactory.getInstance();
        var commandActionsList : BasicArrayList = configuration.getAssociateCommandActionsList();
        var size : Int = commandActionsList.size();
        {
            var index : Int = size - 1;
            while (index >= 0) {
            var association : MotionGestureToMotionGestureActionAssociation = (cast commandActionsList.objectArray[index] : MotionGestureToMotionGestureActionAssociation);
            if (association.isMotionGestureArrayEquals(list) == true) {
                var completeMotionGestureInputEvent : GameKeyCompleteMotionGestureInputEvent = (cast association.getCommandAction() : GameKeyCompleteMotionGestureInputEvent);
                CompleteMotionGestureInputEventHandler.getInstance().fireEvent(completeMotionGestureInputEvent);
                break;
            }
                index--;
            }
        }
    }

}

