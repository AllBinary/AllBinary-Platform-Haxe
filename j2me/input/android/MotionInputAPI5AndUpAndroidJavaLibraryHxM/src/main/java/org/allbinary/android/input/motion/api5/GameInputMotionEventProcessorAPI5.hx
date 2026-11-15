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
package org.allbinary.android.input.motion.api5;

import android.view.MotionEvent;
import org.allbinary.android.input.motion.BaseGameInputMotionEventProcessor;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.displayable.ScalableListener;
import org.allbinary.input.motion.AllMotionRecognizer;
import org.allbinary.input.motion.MotionRecognizer;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.communication.log.LogUtil;

class GameInputMotionEventProcessorAPI5 extends BaseGameInputMotionEventProcessor {
    private static var instance : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : GameInputMotionEventProcessorAPI5 {
        if (GameInputMotionEventProcessorAPI5.instance == NullUtil.getInstance().NULL_OBJECT) {
            GameInputMotionEventProcessorAPI5.instance = new GameInputMotionEventProcessorAPI5();
        }
        return (cast GameInputMotionEventProcessorAPI5.instance : GameInputMotionEventProcessorAPI5);
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    private final displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
    private final motionRecognizerArray : haxe.ds.Vector<MotionRecognizer>;
    private final TOTAL_MINUS_ONE : Int;
    public function new() {
        super();
        final size : Int = GameInputMotionInfoAPI5.getInstance().MAX_POINTERS;
        this.motionRecognizerArray = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) null]);
        this.TOTAL_MINUS_ONE = size;
        for (index in 0...size) {
            this.motionRecognizerArray[index] = new AllMotionRecognizer();
        }
    }

    private function isValid(pointerId : Int) : Bool {
        if (pointerId > this.TOTAL_MINUS_ONE) {
            var message : String = "Log that the pointer Ids are not what would be expected or Android has more than what I set my stuff to support pointerId: ";
            ForcedLogUtil.log(message + pointerId, this);
            return false;
        } else {
            return true;
        }
    }

    public override function process(motionEvent : MotionEvent) : Void {
        try {
            final action : Int = motionEvent.getAction();
            var total : Int = this.motionRecognizerArray.length;
            if (total > motionEvent.getPointerCount()) {
                total = motionEvent.getPointerCount();
            } else {
                var message : String = "Log that Android has more pointers than I have expected so increase it motionEvent.getPointerCount(): ";
                ForcedLogUtil.log(message + motionEvent.getPointerCount(), this);
            }
            final totalMinusOne : Int = total - 1;
            if (action == MotionEvent.ACTION_DOWN) {
                {
                    var pointerIndex : Int = totalMinusOne;
                    while (pointerIndex >= 0) {
                    final pointerId : Int = motionEvent.getPointerId(pointerIndex);
                    if (this.isValid(pointerId)) {
                        final scalableListener : ScalableListener = this.displayInfo.getScalableListener();
                        final x : Int = Std.int(((motionEvent.getX(pointerIndex) - this.displayInfo.getLeft()) / scalableListener.getRatio(this.displayInfo.getRatio())));
                        final y : Int = Std.int(((motionEvent.getY(pointerIndex) - this.displayInfo.getTop()) / scalableListener.getRatio(this.displayInfo.getRatio())));
                        this.motionRecognizerArray[pointerId].processStartMotionEvent(x, y, motionEvent.getDeviceId(), 0);
                    }
                        pointerIndex--;
                    }
                }
            } else if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                {
                    var pointerIndex : Int = totalMinusOne;
                    while (pointerIndex >= 0) {
                    final pointerId : Int = motionEvent.getPointerId(pointerIndex);
                    if (this.isValid(pointerId)) {
                        final scalableListener : ScalableListener = this.displayInfo.getScalableListener();
                        final x : Int = Std.int(((motionEvent.getX(pointerIndex) - this.displayInfo.getLeft()) / scalableListener.getRatio(this.displayInfo.getRatio())));
                        final y : Int = Std.int(((motionEvent.getY(pointerIndex) - this.displayInfo.getTop()) / scalableListener.getRatio(this.displayInfo.getRatio())));
                        this.motionRecognizerArray[pointerId].processEndMotionEvent(x, y, motionEvent.getDeviceId(), 0);
                    }
                        pointerIndex--;
                    }
                }
            } else if (action == MotionEvent.ACTION_MOVE) {
                {
                    var pointerIndex : Int = totalMinusOne;
                    while (pointerIndex >= 0) {
                    final pointerId : Int = motionEvent.getPointerId(pointerIndex);
                    if (this.isValid(pointerId)) {
                        final scalableListener : ScalableListener = this.displayInfo.getScalableListener();
                        final x : Int = Std.int(((motionEvent.getX(pointerIndex) - this.displayInfo.getLeft()) / scalableListener.getRatio(this.displayInfo.getRatio())));
                        final y : Int = Std.int(((motionEvent.getY(pointerIndex) - this.displayInfo.getTop()) / scalableListener.getRatio(this.displayInfo.getRatio())));
                        this.motionRecognizerArray[pointerId].processDraggedMotionEvent(x, y, motionEvent.getDeviceId(), 0);
                    }
                        pointerIndex--;
                    }
                }
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.PROCESS, e);
        }
    }

}

