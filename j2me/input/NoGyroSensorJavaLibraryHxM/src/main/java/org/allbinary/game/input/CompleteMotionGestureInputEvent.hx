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

import org.allbinary.input.motion.gesture.MotionGestureInput;
import org.allbinary.input.motion.gesture.TouchMotionGestureFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.string.CommonStrings;

class CompleteMotionGestureInputEvent extends AllBinaryEventObject implements CompleteMotionGestureInputInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var name : String = StringUtil.getInstance().EMPTY_STRING;
    private var motionGestureInput : MotionGestureInput = TouchMotionGestureFactory.getInstance().NO_MOTION;
    public function new(name : String, motionGestureInput : MotionGestureInput) {
        super(motionGestureInput);
        this.setName(name);
        try {
            this.setMotionGestureInput(motionGestureInput);
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, "InputToGameKeyEventAction", e);
        }
    }

    public function setName(name : String) : Void {
        this.name = name;
    }

    public override function getName() : String {
        return this.name;
    }

    public function setMotionGestureInput(motionGestureInput : MotionGestureInput) : Void {
        this.motionGestureInput = motionGestureInput;
    }

    public function getMotionGestureInput() : MotionGestureInput {
        return this.motionGestureInput;
    }

}

