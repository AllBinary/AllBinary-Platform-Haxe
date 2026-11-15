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
package org.allbinary.android.input.motion.api1;

import android.view.MotionEvent;
import org.allbinary.android.input.motion.BaseGameInputMotionEventProcessor;
import org.allbinary.input.motion.AllMotionRecognizer;
import org.allbinary.input.motion.MotionRecognizer;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;

class GameInputMotionEventProcessorAPI1 extends BaseGameInputMotionEventProcessor {
    private static var instance : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : GameInputMotionEventProcessorAPI1 {
        if (GameInputMotionEventProcessorAPI1.instance == NullUtil.getInstance().NULL_OBJECT) {
            GameInputMotionEventProcessorAPI1.instance = new GameInputMotionEventProcessorAPI1();
        }
        return (cast GameInputMotionEventProcessorAPI1.instance : GameInputMotionEventProcessorAPI1);
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    private final motionRecognizer : MotionRecognizer = new AllMotionRecognizer();
    public function new() {
        super();
    }

    public override function process(motionEvent : MotionEvent) : Void {
        try {
            var x : Int = Std.int(motionEvent.getX());
            var y : Int = Std.int(motionEvent.getY());
            var action : Int = motionEvent.getAction();
            if (action == MotionEvent.ACTION_DOWN) {
                this.motionRecognizer.processStartMotionEvent(x, y, motionEvent.getDeviceId(), 0);
            } else if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                this.motionRecognizer.processEndMotionEvent(x, y, motionEvent.getDeviceId(), 0);
            } else if (action == MotionEvent.ACTION_MOVE) {
                this.motionRecognizer.processDraggedMotionEvent(x, y, motionEvent.getDeviceId(), 0);
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.PROCESS, e);
        }
    }

}

