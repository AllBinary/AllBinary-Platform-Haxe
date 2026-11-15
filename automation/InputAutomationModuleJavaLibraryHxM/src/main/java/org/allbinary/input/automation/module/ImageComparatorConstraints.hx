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

//import java.awt.Color;
//import java.awt.Rectangle;
//import java.awt.image.BufferedImage;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.collision.RectangleCollisionUtil;
import org.allbinary.graphics.GPoint;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.media.image.comparison.ImageComparatorConstraintsInterface;

class ImageComparatorConstraints implements ImageComparatorConstraintsInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var avoidVector : BasicArrayList = null;
    private var maxNonMatchingPixelDeltas : Int = 0;
    private var doImageComparisonEveryNthFrame : Int;
    public function new(doImageComparisonEveryNthFrame : Int) {
        this.doImageComparisonEveryNthFrame = doImageComparisonEveryNthFrame;
        this.setAvoidVector(new BasicArrayListD());
    }

    public function getAvoidVector() : BasicArrayList {
        return this.avoidVector;
    }

    public function isColorAllowed(frame : Int, point : GPoint, color : Color) : Bool {
        throw new haxe.Exception();
    }

    public function isCollisionWithAvoidRectangles(rectangle : Rectangle) : Bool {
        var isCollsionWithAvoidRectangles : Bool = false;
        final avoidVector : BasicArrayList = this.getAvoidVector();
        final size : Int = avoidVector.size();
        for (index in 0...size) {
            var avoidRectangle : Rectangle = (cast avoidVector.get(index) : Rectangle);
            if (RectangleCollisionUtil.isCollision(avoidRectangle, rectangle)) {
                isCollsionWithAvoidRectangles = true;
            }
        }
        return isCollsionWithAvoidRectangles;
    }

    public function isCollisionWithAvoidRectangles(point : GPoint) : Bool {
        var isCollsionWithAvoidRectangles : Bool = false;
        final avoidVector : BasicArrayList = this.getAvoidVector();
        final size : Int = avoidVector.size();
        for (index in 0...size) {
            var avoidRectangle : Rectangle = (cast avoidVector.get(index) : Rectangle);
            if (RectangleCollisionUtil.isCollision(avoidRectangle, point)) {
                isCollsionWithAvoidRectangles = true;
                break;
            }
        }
        return isCollsionWithAvoidRectangles;
    }

    public function setAvoidVector(avoidVector : BasicArrayList) : Void {
        this.avoidVector = avoidVector;
    }

    public function getMaxNonMatchingPixelDeltas() : Int {
        return this.maxNonMatchingPixelDeltas;
    }

    public function setMaxNonMatchingPixelDeltas(maxNonMatchingPixelDeltas : Int) : Void {
        this.maxNonMatchingPixelDeltas = maxNonMatchingPixelDeltas;
    }

    public function isFrameAllowed(frame : Int) : Bool {
        var remainder : Int = ((frame + 1) % this.doImageComparisonEveryNthFrame);
        this.logUtil.putF(" Frame: " + frame + " remainder: " + remainder + " this.doImageComparisonEveryNthFrame: " + this.doImageComparisonEveryNthFrame, this, "isCollisionWithAvoidRectangles");
        if (remainder == 0) {
            return true;
        } else {
            return false;
        }
    }

    // throws Exception
    public function isImageValid(bufferedImage : BufferedImage) : Bool {
        throw new haxe.Exception();
    }

    public function log() : Void {
        final avoidVector : BasicArrayList = this.getAvoidVector();
        final size : Int = avoidVector.size();
        for (index in 0...size) {
            var avoidRectangle : Rectangle = (cast avoidVector.get(index) : Rectangle);
            this.logUtil.putF("Avoid Rectangle: " + avoidRectangle, this, "log");
        }
    }

}

