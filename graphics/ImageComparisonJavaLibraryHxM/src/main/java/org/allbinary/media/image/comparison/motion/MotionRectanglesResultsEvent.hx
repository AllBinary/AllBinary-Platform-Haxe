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
package org.allbinary.media.image.comparison.motion;

import org.allbinary.logic.util.event.AllBinaryEventObject;

class MotionRectanglesResultsEvent extends AllBinaryEventObject {
    private final frame : Null<haxe.Int64>;
    private var motionRectangles : MotionRectangles = null;
    public function new(anyType : Any, frame : Null<haxe.Int64>, motionRectangles : MotionRectangles) {
        super(anyType);
        this.frame = frame;
        this.setMotionRectangles(motionRectangles);
    }

    public function getMotionRectangles() : MotionRectangles {
        return this.motionRectangles;
    }

    public function setMotionRectangles(motionRectangles : MotionRectangles) : Void {
        this.motionRectangles = motionRectangles;
    }

    public function getFrame() : Null<haxe.Int64> {
        return this.frame;
    }

}

