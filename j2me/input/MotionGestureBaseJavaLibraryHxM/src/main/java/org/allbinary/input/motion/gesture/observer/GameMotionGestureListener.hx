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

import org.allbinary.input.motion.gesture.MotionGestureInput;
import org.allbinary.input.motion.gesture.TouchMotionGestureFactory;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class GameMotionGestureListener implements MotionGestureEventListener {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var motionGestureCollection : BasicArrayList = new BasicArrayListD();
    private var touchGestureCollection : BasicArrayList = new BasicArrayListD();
    private var signed : CompleteMotionGestureListenerInterface;
    public function new(signed : CompleteMotionGestureListenerInterface) {
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        this.signed = signed;
    }

    public function onEvent(eventObject : AllBinaryEventObject) : Void {
        ForcedLogUtil.log(this.commonStrings.NOT_IMPLEMENTED, this);
    }

    public function onUpMotionGestureEvent(ev : MotionGestureEvent) : Void {
        this.onMotionGestureEvent(ev);
    }

    public function onDownMotionGestureEvent(ev : MotionGestureEvent) : Void {
        this.onMotionGestureEvent(ev);
    }

    public function onLeftMotionGestureEvent(ev : MotionGestureEvent) : Void {
        this.onMotionGestureEvent(ev);
    }

    public function onRightMotionGestureEvent(ev : MotionGestureEvent) : Void {
        this.onMotionGestureEvent(ev);
    }

    public function onDiagonalDownRightMotionGestureEvent(ev : MotionGestureEvent) : Void {
        this.onMotionGestureEvent(ev);
    }

    public function onDiagonalDownLeftMotionGestureEvent(ev : MotionGestureEvent) : Void {
        this.onMotionGestureEvent(ev);
    }

    public function onDiagonalUpRightMotionGestureEvent(ev : MotionGestureEvent) : Void {
        this.onMotionGestureEvent(ev);
    }

    public function onDiagonalUpLeftMotionGestureEvent(ev : MotionGestureEvent) : Void {
        this.onMotionGestureEvent(ev);
    }

    public function onPressedMotionGestureEvent(ev : MotionGestureEvent) : Void {
        this.touchGestureCollection.add(ev.getMotionGesture());
    }

    public function released(ev : MotionGestureEvent) : Void {
        try {
            this.touchGestureCollection.add(ev.getMotionGesture());
            this.signed.onMotionGestureCompleted(this.touchGestureCollection);
            this.touchGestureCollection.clear();
        } catch (e : haxe.Exception) {
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(this.commonStrings.EXCEPTION_LABEL);
            stringBuffer.append(StringUtil.getInstance().toString(ev.getMotionGesture()));
            this.logUtil.put(stringBuffer.toString(), this, "release", e);
        }
    }

    public function onScrolledMotionGestureEvent(motionGestureEvent : MotionGestureEvent) : Void {
    }

    public function onMotionGestureEvent(ev : MotionGestureEvent) : Void {
        try {
            var motionGestureInput : MotionGestureInput = ev.getMotionGesture();
            if (motionGestureInput == TouchMotionGestureFactory.getInstance().PRESSED) {
                this.onPressedMotionGestureEvent(ev);
            } else if (motionGestureInput == TouchMotionGestureFactory.getInstance().RELEASED) {
                this.released(ev);
            } else {
                this.motionGestureCollection.add(motionGestureInput);
                this.signed.onMotionGestureCompleted(this.motionGestureCollection);
                this.motionGestureCollection.clear();
                this.touchGestureCollection.clear();
            }
        } catch (e : haxe.Exception) {
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(this.commonStrings.EXCEPTION_LABEL);
            stringBuffer.append(StringUtil.getInstance().toString(ev.getMotionGesture()));
            this.logUtil.put(stringBuffer.toString(), this, "onMotionGestureEvent", e);
        }
    }

}

