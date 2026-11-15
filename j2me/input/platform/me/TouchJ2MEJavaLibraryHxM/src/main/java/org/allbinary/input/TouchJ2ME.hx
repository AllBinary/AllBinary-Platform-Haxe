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
package org.allbinary.input;

import org.allbinary.input.motion.AllMotionRecognizer;
import org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler;
import org.allbinary.input.motion.gesture.observer.GameMotionGestureListener;
import org.allbinary.input.motion.gesture.observer.MotionGestureReceiveInterfaceFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

//TouchJ2ME
class TouchJ2ME {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final DEVICE_ID : Int = 0;
    private var motionRecognizer : AllMotionRecognizer = new AllMotionRecognizer();
    public function new() {
        var motionGesturesHandler : BasicMotionGesturesHandler = this.motionRecognizer.getMotionGestureRecognizer().getMotionGesturesHandler();
        motionGesturesHandler.addListenerInterface(new GameMotionGestureListener(MotionGestureReceiveInterfaceFactory.getInstance()));
    }

    public function pointerDragged(x : Int, y : Int) : Void {
        try {
            this.motionRecognizer.processDraggedMotionEvent(x, y, DEVICE_ID, 0);
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, "pointerDragged", e);
        }
    }

    public function pointerPressed(x : Int, y : Int) : Void {
        try {
            this.motionRecognizer.processStartMotionEvent(x, y, DEVICE_ID, 0);
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, "pointerPressed", e);
        }
    }

    public function pointerReleased(x : Int, y : Int) : Void {
        try {
            this.motionRecognizer.processEndMotionEvent(x, y, DEVICE_ID, 0);
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, "pointerReleased", e);
        }
    }

}

