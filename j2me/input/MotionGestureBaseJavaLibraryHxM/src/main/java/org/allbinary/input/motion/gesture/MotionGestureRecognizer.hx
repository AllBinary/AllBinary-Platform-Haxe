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
import org.allbinary.graphics.Line;
import org.allbinary.graphics.PointFactory;
import org.allbinary.input.motion.gesture.configuration.MotionGestureConfiguration;
import org.allbinary.input.motion.gesture.configuration.MotionGestureConfigurationFactory;
import org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler;
import org.allbinary.input.motion.gesture.observer.MotionEventCircularPool;
import org.allbinary.input.motion.gesture.observer.MotionGestureEvent;
import org.allbinary.input.motion.gesture.observer.MovedMotionGesturesHandler;
import org.allbinary.input.motion.gesture.observer.ScrolledMotionGesturesHandler;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.math.J2SEMath;
import org.allbinary.logic.util.event.handler.BasicEventHandler;
import org.allbinary.string.CommonStrings;

class MotionGestureRecognizer {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final j2seMath : J2SEMath = J2SEMath.getInstance();
    private final origin : GPoint = PointFactory.getInstance().ZERO_ZERO;
    private var previous : GPoint = this.origin;
    private var intermediate : GPoint = this.origin;
    private final line : Line = new Line(this.origin, this.origin);
    private final motionGesturesHandler : BasicMotionGesturesHandler;
    private final movedMotionGesturesHandler : BasicEventHandler;
    private final scrolledMotionGesturesHandler : BasicEventHandler;
    private final motionEventCircularPool : MotionEventCircularPool;
    public function new(id : Int) {
        this.motionEventCircularPool = MotionEventCircularPool.createPool(id);
        var motionGesturesHandler : BasicEventHandler = new BasicEventHandler();
        var movedMotionGesturesHandler : BasicEventHandler = motionGesturesHandler;
        var scrolledMotionGesturesHandler : BasicEventHandler = motionGesturesHandler;
        try {
            motionGesturesHandler = BasicMotionGesturesHandler.getInstance();
            movedMotionGesturesHandler = MovedMotionGesturesHandler.getInstance();
            scrolledMotionGesturesHandler = ScrolledMotionGesturesHandler.getInstance();
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e);
        }
        this.motionGesturesHandler = (cast motionGesturesHandler : BasicMotionGesturesHandler);
        this.movedMotionGesturesHandler = movedMotionGesturesHandler;
        this.scrolledMotionGesturesHandler = scrolledMotionGesturesHandler;
    }

    // throws Exception
    public function processPressedMotionEvent(current : GPoint, deviceId : Int, button : Int) : Bool {
        this.intermediate = this.origin;
        this.previous = this.origin;
        final event : MotionGestureEvent = this.motionEventCircularPool.getInstance(TouchMotionGestureFactory.getInstance().PRESSED);
        event.setPreviousPoint(this.previous);
        event.setCurrentPoint(current);
        this.motionGesturesHandler.fireEvent(event);
        return true;
    }

    // throws Exception
    public function processReleasedMotionEvent(current : GPoint, deviceId : Int, button : Int) : Bool {
        final event : MotionGestureEvent = this.motionEventCircularPool.getInstance(TouchMotionGestureFactory.getInstance().RELEASED);
        event.setPreviousPoint(this.previous);
        event.setCurrentPoint(current);
        this.motionGesturesHandler.fireEvent(event);
        return true;
    }

    // throws Exception
    public function processDraggedMotionEvent(current : GPoint, deviceId : Int, buttonMask : Int) : Void {
        if (this.previous == this.origin || this.intermediate == this.origin) {
            this.previous = current;
            this.intermediate = current;
            return;
        }
        this.line.setP1(this.previous);
        this.line.setP2(current);
        var minimumMotionGesture : Int = MotionGestureConfigurationFactory.getInstance().getMinimumMotionGesture();
        if (this.j2seMath.abs(this.line.getDeltaX()) < minimumMotionGesture && this.j2seMath.abs(this.line.getDeltaY()) < minimumMotionGesture) {
            this.intermediate = current;
            return;
        }
        var gradient : Float = this.line.getGradient();
        var absGradient : Float = this.j2seMath.abs(gradient);
        final conf : MotionGestureConfiguration = MotionGestureConfigurationFactory.getInstance();
        final touchMotionGestureFactory : TouchMotionGestureFactory = TouchMotionGestureFactory.getInstance();
        var newMotionGesture : MotionGestureInput = touchMotionGestureFactory.NO_MOTION;
        var diagonalToleranceHigher : Float = 12.0;
        var diagonalToleranceLower : Float = 12.0;
        if (conf.isDiagonalMotionGestureAllowed()) {
            diagonalToleranceHigher = (90 - conf.getDiagonalTolerance());
            diagonalToleranceLower = conf.getDiagonalTolerance();
        }
        if (absGradient > Math.tan(((diagonalToleranceHigher) * Math.PI / 180))) {
            if (this.line.getDeltaY() > 0) {
                newMotionGesture = touchMotionGestureFactory.UP;
            } else {
                newMotionGesture = touchMotionGestureFactory.DOWN;
            }
        } else {
            if (absGradient < Math.tan(((diagonalToleranceLower) * Math.PI / 180))) {
                if (this.line.getDeltaX() > 0) {
                    newMotionGesture = touchMotionGestureFactory.LEFT;
                } else {
                    newMotionGesture = touchMotionGestureFactory.RIGHT;
                }
            } else {
                if (gradient > 0.0) {
                    if (this.line.getDeltaX() > 0) {
                        newMotionGesture = touchMotionGestureFactory.DIAGONAL_UP_LEFT;
                    } else {
                        newMotionGesture = touchMotionGestureFactory.DIAGONAL_DOWN_RIGHT;
                    }
                } else {
                    if (this.line.getDeltaX() > 0) {
                        newMotionGesture = touchMotionGestureFactory.DIAGONAL_DOWN_LEFT;
                    } else {
                        newMotionGesture = touchMotionGestureFactory.DIAGONAL_UP_RIGHT;
                    }
                }
            }
        }
        this.previous = current;
        this.intermediate = current;
        final event : MotionGestureEvent = this.motionEventCircularPool.getInstance(newMotionGesture);
        event.setPreviousPoint(this.previous);
        event.setCurrentPoint(current);
        this.motionGesturesHandler.fireEvent(event);
        return;
    }

    // throws Exception
    public function processMovedMotionEvent(current : GPoint, deviceId : Int, button : Int) : Bool {
        final event : MotionGestureEvent = this.motionEventCircularPool.getInstance(TouchMotionGestureFactory.getInstance().NO_MOTION);
        event.setPreviousPoint(this.previous);
        event.setCurrentPoint(current);
        this.movedMotionGesturesHandler.fireEvent(event);
        return true;
    }

    // throws Exception
    public function processScrolledMotionEvent(current : GPoint, deviceId : Int, button : Int) : Bool {
        final touchMotionGestureFactory : TouchMotionGestureFactory = TouchMotionGestureFactory.getInstance();
        var newMotionGesture : MotionGestureInput = touchMotionGestureFactory.NO_MOTION;
        if (button > 0) {
            newMotionGesture = touchMotionGestureFactory.SCROLL_UP;
        } else if (button < 0) {
            newMotionGesture = touchMotionGestureFactory.SCROLL_DOWN;
        }
        final event : MotionGestureEvent = this.motionEventCircularPool.getInstance(newMotionGesture);
        event.setPreviousPoint(this.previous);
        event.setCurrentPoint(current);
        this.scrolledMotionGesturesHandler.fireEvent(event);
        return true;
    }

    public function getMotionGesturesHandler() : BasicMotionGesturesHandler {
        return this.motionGesturesHandler;
    }

}

