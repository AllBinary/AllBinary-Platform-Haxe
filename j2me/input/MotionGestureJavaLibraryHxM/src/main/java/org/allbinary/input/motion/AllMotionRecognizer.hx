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
package org.allbinary.input.motion;

import org.allbinary.graphics.CustomGPoint;
import org.allbinary.graphics.GPointCircularPool;
import org.allbinary.input.motion.button.TouchButtonRecognizer;
import org.allbinary.input.motion.gesture.MotionGestureRecognizer;
import org.allbinary.logic.communication.log.LogUtil;

class AllMotionRecognizer extends MotionRecognizer {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final motionGestureRecognizer : MotionGestureRecognizer;
    private var touchButtonProcessing : Bool = false;
    private final touchButtonRecognizer : TouchButtonRecognizer;
    private final id : Int;
    private static var index : Int = 0;
    private static final pointCircularPool : GPointCircularPool = new GPointCircularPool(40);
    public function new() {
        super();
        this.id = AllMotionRecognizer.index++;
        this.motionGestureRecognizer = new MotionGestureRecognizer(this.id);
        this.touchButtonRecognizer = new TouchButtonRecognizer();
    }

    // throws Exception
    public override function processStartMotionEvent(x : Int, y : Int, deviceId : Int, modifiers : Int) : Void {
        if (this.touchButtonRecognizer.pressTouchButtonInput(x, y, deviceId)) {
            this.touchButtonProcessing = true;
        }
        if (!this.touchButtonProcessing) {
            final point : CustomGPoint = (cast AllMotionRecognizer.pointCircularPool.getNextInstance() : CustomGPoint);
            point.setX(x);
            point.setY(y);
            this.motionGestureRecognizer.processPressedMotionEvent(point, deviceId, modifiers);
        }
    }

    // throws Exception
    public override function processEndMotionEvent(x : Int, y : Int, deviceId : Int, modifiers : Int) : Void {
        if (this.touchButtonRecognizer.releaseTouchButtonInput(x, y, deviceId)) {
        }
        if (!this.touchButtonProcessing) {
            final point : CustomGPoint = (cast AllMotionRecognizer.pointCircularPool.getNextInstance() : CustomGPoint);
            point.setX(x);
            point.setY(y);
            this.motionGestureRecognizer.processReleasedMotionEvent(point, deviceId, modifiers);
        }
        if (this.touchButtonProcessing) {
            this.touchButtonProcessing = false;
        }
    }

    // throws Exception
    public override function processDraggedMotionEvent(x : Int, y : Int, deviceId : Int, modifiers : Int) : Void {
        if (this.touchButtonProcessing) {
            this.touchButtonRecognizer.pressTouchButtonInput(x, y, deviceId);
        }
        if (!this.touchButtonProcessing) {
            final point : CustomGPoint = (cast AllMotionRecognizer.pointCircularPool.getNextInstance() : CustomGPoint);
            point.setX(x);
            point.setY(y);
            this.motionGestureRecognizer.processDraggedMotionEvent(point, deviceId, modifiers);
        }
    }

    private var lastX : Int = 0;
    private var lastY : Int = 0;
    // throws Exception
    public function processMovedMotionEvent(x : Int, y : Int, deviceId : Int, modifiers : Int) : Void {
        if (x != this.lastX || y != this.lastY) {
            this.lastX = x;
            this.lastY = y;
            final point : CustomGPoint = (cast AllMotionRecognizer.pointCircularPool.getNextInstance() : CustomGPoint);
            point.setX(x);
            point.setY(y);
            this.motionGestureRecognizer.processMovedMotionEvent(point, deviceId, modifiers);
        }
    }

    // throws Exception
    public function processScrolledMotionEvent(x : Int, y : Int, deviceId : Int, modifiers : Int) : Void {
        final point : CustomGPoint = (cast AllMotionRecognizer.pointCircularPool.getNextInstance() : CustomGPoint);
        point.setX(x);
        point.setY(y);
        this.motionGestureRecognizer.processScrolledMotionEvent(point, deviceId, modifiers);
    }

    public function getMotionGestureRecognizer() : MotionGestureRecognizer {
        return this.motionGestureRecognizer;
    }

}

