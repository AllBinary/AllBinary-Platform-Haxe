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
package org.allbinary.input.automation.module;

//import java.awt.*;
//import java.awt.image.BufferedImage;
import org.allbinary.media.image.comparison.motion.MotionRectangleConstraintsInterface;

class MotionRectangleConstraints implements MotionRectangleConstraintsInterface {
    private var minDimension : Dimension = null;
    private var maxDimension : Dimension = null;
    private var maxMotionRectangles : Int = 0;
    private var minArea : Int = 0;
    public function new() {
    }

    public function getMinDimension() : Dimension {
        return this.minDimension;
    }

    public function getMaxDimension() : Dimension {
        return this.maxDimension;
    }

    public function isTooSmall(rectangle : Rectangle) : Bool {
        if (rectangle.width < this.getMinDimension().width || rectangle.height < this.getMinDimension().height) {
            return true;
        } else {
            return false;
        }
    }

    public function isAreaTooSmall(rectangle : Rectangle) : Bool {
        if (rectangle.width * rectangle.height < this.getMinArea()) {
            return true;
        } else {
            return false;
        }
    }

    public function isTooBig(rectangle : Rectangle) : Bool {
        if (rectangle.width > this.getMaxDimension().width || rectangle.height > this.getMaxDimension().height) {
            return true;
        } else {
            return false;
        }
    }

    // throws Exception
    public function isValid(frame : Null<haxe.Int64>, bufferedImage : BufferedImage, rectangle : Rectangle) : Bool {
        throw new haxe.Exception();
    }

    public function setMinDimension(minDimension : Dimension) : Void {
        this.minDimension = minDimension;
    }

    public function setMaxDimension(maxDimension : Dimension) : Void {
        this.maxDimension = maxDimension;
    }

    public function getMaxMotionRectangles() : Int {
        return this.maxMotionRectangles;
    }

    public function setMaxMotionRectangles(maxMotionRectangles : Int) : Void {
        this.maxMotionRectangles = maxMotionRectangles;
    }

    public function getMinArea() : Int {
        return this.minArea;
    }

    public function setMinArea(minArea : Int) : Void {
        this.minArea = minArea;
    }

}

