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

//import java.awt.Rectangle;
//import java.awt.image.BufferedImage;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;

class ConstrainedMotionRectangles extends MotionRectangles {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final NAME : String = "constrainedMotionRectangles_";
    private var motionRectangleConstraintsInterface : MotionRectangleConstraintsInterface = null;
    public function new(motionRectangleConstraintsInterface : MotionRectangleConstraintsInterface, motionRectangles : MotionRectangles) {
        super(NAME, motionRectangles.getImageComparisonResult());
        this.setMotionRectangleConstraintsInterface(motionRectangleConstraintsInterface);
    }

    // throws Exception
    public function applyMotionRectangleConstraints(motionRectangles : MotionRectangles) : Void {
        this.logUtil.putF("Start - Size Before: " + motionRectangles.getVector().size(), this, "applyMotionRectangleConstraints");
        final bufferedImageArray : haxe.ds.Vector<BufferedImage> = motionRectangles.getImageComparisonResult().getBufferedImages();
        var bufferedImage : BufferedImage = bufferedImageArray[1];
        final vector : BasicArrayList = new BasicArrayListD();
        final vector2 : BasicArrayList = motionRectangles.getVector();
        final size : Int = vector2.size();
        for (index in 0...size) {
            final motionRectangle : MotionRectangle = (cast vector2.get(index) : MotionRectangle);
            final rectangle : Rectangle = motionRectangle.getRectangle();
            final isTooSmall : Bool = this.getMotionRectangleConstraintsInterface().isTooSmall(rectangle);
            if (isTooSmall) {
                continue;
            }
            var isAreaTooSmall : Bool = this.getMotionRectangleConstraintsInterface().isAreaTooSmall(rectangle);
            if (isAreaTooSmall) {
                continue;
            }
            var isTooBig : Bool = this.getMotionRectangleConstraintsInterface().isTooBig(rectangle);
            if (isTooBig) {
                continue;
            }
            var isValid : Bool = this.getMotionRectangleConstraintsInterface().isValid(this.getImageComparisonResult().getFrameTwo(), bufferedImage, motionRectangle.getRectangle());
            if (!isValid) {
                continue;
            }
            if (!isTooSmall && !isAreaTooSmall && !isTooBig && isValid) {
                vector.add(motionRectangle);
            }
        }
        this.setVector(vector);
    }

    public function getMotionRectangleConstraintsInterface() : MotionRectangleConstraintsInterface {
        return this.motionRectangleConstraintsInterface;
    }

    public function setMotionRectangleConstraintsInterface(motionRectangleConstraintsInterface : MotionRectangleConstraintsInterface) : Void {
        this.motionRectangleConstraintsInterface = motionRectangleConstraintsInterface;
    }

}

