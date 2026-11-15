/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2009 AllBinary
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
package org.allbinary.android.input.motion;

import android.view.MotionEvent;
import org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler;
import org.allbinary.input.motion.gesture.observer.GameMotionGestureListener;
import org.allbinary.input.motion.gesture.observer.MotionGestureReceiveInterfaceFactory;
import org.allbinary.string.CommonStrings;

class BaseGameInputMotionEventProcessor extends MotionEventProcessor {
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final gameMotionGestureListener : GameMotionGestureListener;
    public function new() {
        super();
        this.gameMotionGestureListener = new GameMotionGestureListener(MotionGestureReceiveInterfaceFactory.getInstance());
        this.addListener();
    }

    public override function process(motionEvent : MotionEvent) : Void {
    }

    public function addListener() : Void {
        var motionGesturesHandler : BasicMotionGesturesHandler = BasicMotionGesturesHandler.getInstance();
        motionGesturesHandler.addListenerInterface(this.gameMotionGestureListener);
    }

}

