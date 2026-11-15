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
package org.allbinary.game.displayable.canvas;

import javax.microedition.lcdui.Canvas;
import javax.microedition.lcdui.NullCanvas;
import org.allbinary.game.input.PlayerGameInput;
import org.allbinary.graphics.displayable.MyCanvas;
import org.allbinary.input.motion.gesture.observer.BaseMotionGestureEventListener;
import org.allbinary.input.motion.gesture.observer.MotionGestureEvent;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class BasicMenuInputProcessor extends PlayerGameInput implements BaseMotionGestureEventListener {
    public final motionGestureEventList : BasicArrayList = new BasicArrayListD();
    private var canvas : Canvas = NullCanvas.NULL_CANVAS;
    public function new(gameKeyEventList : BasicArrayList, playerInputId : Int, gameCanvas : Canvas) {
        super(gameKeyEventList, new BasicArrayListD(), playerInputId);
        this.canvas = gameCanvas;
    }

    public override function onMotionGestureEvent(motionGestureEvent : MotionGestureEvent) : Void {
        this.motionGestureEventList.add(motionGestureEvent);
    }

    public override function onScrolledMotionGestureEvent(motionGestureEvent : MotionGestureEvent) : Void {
    }

    private function setCanvas(canvas : MyCanvas) : Void {
        this.canvas = canvas;
    }

    public function getCanvas() : MyCanvas {
        return (cast this.canvas : MyCanvas);
    }

    // throws Exception
    public function processInputList() : Int {
        return -1;
    }

}

