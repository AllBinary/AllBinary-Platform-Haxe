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
import org.allbinary.game.input.motion.action.SingleKeyPressGameKeyFromMotionGestureEventListener;
import org.allbinary.input.motion.trackball.action.DownTrackballInputToGameKeyEventAction;
import org.allbinary.input.motion.trackball.action.LeftTrackballInputToGameKeyEventAction;
import org.allbinary.input.motion.trackball.action.RightTrackballInputToGameKeyEventAction;
import org.allbinary.input.motion.trackball.action.UpTrackballInputToGameKeyEventAction;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class TrackballGameInputMotionEventProcessor extends MotionEventProcessor {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static var PROCESSOR : TrackballGameInputMotionEventProcessor = new TrackballGameInputMotionEventProcessor();
    public static function getInstance() : TrackballGameInputMotionEventProcessor {
        return TrackballGameInputMotionEventProcessor.PROCESSOR;
    }

    private final listener : SingleKeyPressGameKeyFromMotionGestureEventListener = new SingleKeyPressGameKeyFromMotionGestureEventListener();
    public function new() {
        super();
    }

    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    public override function process(motionEvent : MotionEvent) : Void {
        try {
            var x : Float = motionEvent.getX();
            var y : Float = motionEvent.getY();
            if (x < 0.0) {
                this.listener.onCompleteMotionGestureInputEvent(LeftTrackballInputToGameKeyEventAction.getInstance());
            } else if (x > 0.0) {
                this.listener.onCompleteMotionGestureInputEvent(RightTrackballInputToGameKeyEventAction.getInstance());
            }
            if (y < 0.0) {
                this.listener.onCompleteMotionGestureInputEvent(UpTrackballInputToGameKeyEventAction.getInstance());
            } else if (y > 0.0) {
                this.listener.onCompleteMotionGestureInputEvent(DownTrackballInputToGameKeyEventAction.getInstance());
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.PROCESS, e);
        }
    }

}

