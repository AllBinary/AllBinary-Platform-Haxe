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
package org.allbinary.input.motion.gesture;

import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.PointFactory;
import org.allbinary.input.motion.gesture.observer.MotionEventCircularPool;
import org.allbinary.input.motion.gesture.observer.MotionGestureEvent;

class MirrorMotionGestureEventUtil {
    private static final instance : MirrorMotionGestureEventUtil = new MirrorMotionGestureEventUtil();
    private final motionEventCircularPool : MotionEventCircularPool;
    public function new() {
        this.motionEventCircularPool = MotionEventCircularPool.createPool(Integer.MAX_VALUE);
    }

    // throws Exception
    public function mirrorVerticle(motionGestureEvent : MotionGestureEvent, halfWidth : Int) : MotionGestureEvent {
        final event : MotionGestureEvent = this.motionEventCircularPool.getInstanceFor(motionGestureEvent.getMotionGesture());
        final previousNewX : Int = this.getNewX(motionGestureEvent.getPreviousPoint().getX(), halfWidth);
        final currentNewX : Int = this.getNewX(motionGestureEvent.getCurrentPoint().getX(), halfWidth);
        final pointFactory : PointFactory = PointFactory.getInstance();
        final mirroredPreviousPoint : GPoint = pointFactory.createXY(previousNewX, motionGestureEvent.getPreviousPoint().getY());
        final mirroredCurrentPoint : GPoint = pointFactory.createXY(currentNewX, motionGestureEvent.getCurrentPoint().getY());
        event.setPreviousPoint(mirroredPreviousPoint);
        event.setCurrentPoint(mirroredCurrentPoint);
        return event;
    }

    public function getNewX(x : Int, halfWidth : Int) : Int {
        var newX : Int = 0;
        if (x > halfWidth) {
            newX = halfWidth - (x - halfWidth);
        } else {
            newX = halfWidth + (halfWidth - x);
        }
        return newX;
    }

    public static function getInstance() : MirrorMotionGestureEventUtil {
        return MirrorMotionGestureEventUtil.instance;
    }

}

