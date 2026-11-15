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

//import java.awt.*;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.media.image.comparison.ImageComparisonResult;
import org.allbinary.media.image.comparison.pixel.PixelDelta;

class AllMotionRectangles extends MotionRectangles {
    private static final NAME : String = "allMotionRectangles_";
    public function new(imageComparisonResult : ImageComparisonResult) {
        super(NAME, imageComparisonResult);
        this.createMotionRectangles(imageComparisonResult);
    }

    // throws Exception
    private function createMotionRectangles(imageComparisonInfo : ImageComparisonResult) : Void {
        final vector : BasicArrayList = imageComparisonInfo.getNonMatchingPixelVector();
        final size : Int = vector.size();
        for (index in 0...size) {
            var pixelDelta : PixelDelta = (cast vector.get(index) : PixelDelta);
            this.addPixelDeltaToAMotionRectangle(pixelDelta);
        }
    }

    // throws Exception
    private function addPixelDeltaToExistingMotionRectangle(pixelDelta : PixelDelta) : Bool {
        final vector : BasicArrayList = this.getVector();
        final size : Int = vector.size();
        for (index in 0...size) {
            var motionRectangle : MotionRectangle = (cast vector.get(index) : MotionRectangle);
            if (shouldPixelDeltaPartOfMotionRectangle(motionRectangle, pixelDelta)) {
                var newWidth : Int = pixelDelta.getPoint().getX() - motionRectangle.getRectangle().x;
                var newHeight : Int = pixelDelta.getPoint().getY() - motionRectangle.getRectangle().y;
                if (newWidth < motionRectangle.getRectangle().width) {
                    newWidth = motionRectangle.getRectangle().width;
                }
                if (newHeight < motionRectangle.getRectangle().height) {
                    newHeight = motionRectangle.getRectangle().height;
                }
                motionRectangle.getRectangle().setSize(newWidth, newHeight);
                return true;
            }
        }
        return false;
    }

    // throws Exception
    private function addPixelDeltaToAMotionRectangle(pixelDelta : PixelDelta) : Void {
        if (!addPixelDeltaToExistingMotionRectangle(pixelDelta)) {
            var newRectangle : Rectangle = new Rectangle(pixelDelta.getPoint().getX(), pixelDelta.getPoint().getY(), 1, 1);
            var motionRectangle : MotionRectangle = new MotionRectangle(newRectangle);
            motionRectangle.getPixelDeltaVector().add(pixelDelta);
            this.getVector().add(motionRectangle);
        }
    }

    // throws Exception
    private function shouldPixelDeltaPartOfMotionRectangle(motionRectangle : MotionRectangle, pixelDelta : PixelDelta) : Bool {
        var isPixelLeftOfTheRectangle : Bool = false;
        if (motionRectangle.getRectangle().y > pixelDelta.getPoint().getY()) {
            throw new haxe.Exception("PixelAboveTheRectangle");
        }
        if (motionRectangle.getRectangle().x > pixelDelta.getPoint().getX()) {
            isPixelLeftOfTheRectangle = true;
        }
        if (!isPixelLeftOfTheRectangle) {
            return this.isPixelDeltaLikelyPartOfMotionRectangle(motionRectangle, pixelDelta);
        }
        return false;
    }

    // throws Exception
    private function isPixelDeltaLikelyPartOfMotionRectangle(motionRectangle : MotionRectangle, pixelDelta : PixelDelta) : Bool {
        var maxX : Int = motionRectangle.getRectangle().x + motionRectangle.getRectangle().width;
        var maxY : Int = motionRectangle.getRectangle().y + motionRectangle.getRectangle().height;
        var horizontalDistance : Int = pixelDelta.getPoint().getX() - maxX;
        var verticalDistance : Int = pixelDelta.getPoint().getY() - maxY;
        if (horizontalDistance < this.MAX_PIXEL_DISTANCE_THRESHOLD && verticalDistance < this.MAX_PIXEL_DISTANCE_THRESHOLD) {
            return true;
        }
        return false;
    }

}

