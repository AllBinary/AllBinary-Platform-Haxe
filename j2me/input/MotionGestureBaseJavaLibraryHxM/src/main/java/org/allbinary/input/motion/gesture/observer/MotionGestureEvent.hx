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

import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.PointFactory;
import org.allbinary.input.motion.gesture.MotionGestureInput;
import org.allbinary.input.motion.gesture.TouchMotionGestureFactory;
import org.allbinary.TsUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.string.CommonLabels;

class MotionGestureEvent extends AllBinaryEventObject {
    private var motionGesture : MotionGestureInput = TouchMotionGestureFactory.getInstance().NO_MOTION;
    private final id : Int;
    private var previousPoint : GPoint = PointFactory.getInstance().ZERO_ZERO;
    private var currentPoint : GPoint = PointFactory.getInstance().ZERO_ZERO;
    public function new(source : Any, id : Int, motionGesture : MotionGestureInput) {
        super(source);
        this.id = id;
        this.setMotionGesture(motionGesture);
    }

    public function getMotionGesture() : MotionGestureInput {
        return this.motionGesture;
    }

    public function setMotionGesture(motionGesture : MotionGestureInput) : Void {
        this.motionGesture = motionGesture;
    }

    public function getPreviousPoint() : GPoint {
        return this.previousPoint;
    }

    public function setPreviousPoint(previousPoint : GPoint) : Void {
        this.previousPoint = previousPoint;
    }

    public function getCurrentPoint() : GPoint {
        return this.currentPoint;
    }

    public function setCurrentPoint(currentPoint : GPoint) : Void {
        this.currentPoint = currentPoint;
    }

    private static final PREVIOUS : String = " Previous: ";
    private static final HASHCODE : String = " hashcode: ";
    private final commonLabels : CommonLabels = CommonLabels.getInstance();
    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        final stringUtil : StringUtil = StringUtil.getInstance();
        stringBuffer.append(stringUtil.toString(this.motionGesture));
        stringBuffer.append(this.commonLabels.CURRENT);
        stringBuffer.append(stringUtil.toString(this.currentPoint));
        stringBuffer.append(MotionGestureEvent.PREVIOUS);
        stringBuffer.append(stringUtil.toString(this.previousPoint));
        stringBuffer.append(MotionGestureEvent.HASHCODE);
        stringBuffer.appendint(Std.int(TsUtil.getInstance().hashCode(this)));
        return Std.string(stringBuffer);
    }

    public function getId() : Int {
        return this.id;
    }

}

