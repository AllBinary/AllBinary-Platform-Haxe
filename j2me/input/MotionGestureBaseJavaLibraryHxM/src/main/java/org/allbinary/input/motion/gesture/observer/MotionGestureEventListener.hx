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


interface MotionGestureEventListener extends BaseMotionGestureEventListener {
    function onPressedMotionGestureEvent(ev : MotionGestureEvent) : Void;

    function onUpMotionGestureEvent(ev : MotionGestureEvent) : Void;

    function onDownMotionGestureEvent(ev : MotionGestureEvent) : Void;

    function onLeftMotionGestureEvent(ev : MotionGestureEvent) : Void;

    function onRightMotionGestureEvent(ev : MotionGestureEvent) : Void;

    function onDiagonalDownRightMotionGestureEvent(ev : MotionGestureEvent) : Void;

    function onDiagonalDownLeftMotionGestureEvent(ev : MotionGestureEvent) : Void;

    function onDiagonalUpRightMotionGestureEvent(ev : MotionGestureEvent) : Void;

    function onDiagonalUpLeftMotionGestureEvent(ev : MotionGestureEvent) : Void;

    // throws Exception
    function released(ev : MotionGestureEvent) : Void;

}

