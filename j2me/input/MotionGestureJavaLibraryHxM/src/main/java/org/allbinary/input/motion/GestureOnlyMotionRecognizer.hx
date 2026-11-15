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
import org.allbinary.input.motion.gesture.MotionGestureRecognizer;

class GestureOnlyMotionRecognizer extends MotionRecognizer {
    private final motionGestureRecognizer : MotionGestureRecognizer;
    private final id : Int;
    private static var index : Int = 0;
    private static final pointCircularPool : GPointCircularPool = new GPointCircularPool(40);
    public function new() {
        super();
        this.id = GestureOnlyMotionRecognizer.index++;
        this.motionGestureRecognizer = new MotionGestureRecognizer(this.id);
    }

    // throws Exception
    public override function processStartMotionEvent(x : Int, y : Int, deviceId : Int, modifiers : Int) : Void {
        var point : CustomGPoint = (cast GestureOnlyMotionRecognizer.pointCircularPool.getNextInstance() : CustomGPoint);
        point.setX(x);
        point.setY(y);
        this.motionGestureRecognizer.processPressedMotionEvent(point, deviceId, modifiers);
    }

    // throws Exception
    public override function processEndMotionEvent(x : Int, y : Int, deviceId : Int, modifiers : Int) : Void {
        var point : CustomGPoint = (cast GestureOnlyMotionRecognizer.pointCircularPool.getNextInstance() : CustomGPoint);
        point.setX(x);
        point.setY(y);
        this.motionGestureRecognizer.processReleasedMotionEvent(point, deviceId, modifiers);
    }

    // throws Exception
    public override function processDraggedMotionEvent(x : Int, y : Int, deviceId : Int, modifiers : Int) : Void {
        var point : CustomGPoint = (cast GestureOnlyMotionRecognizer.pointCircularPool.getNextInstance() : CustomGPoint);
        point.setX(x);
        point.setY(y);
        this.motionGestureRecognizer.processDraggedMotionEvent(point, deviceId, modifiers);
    }

}

