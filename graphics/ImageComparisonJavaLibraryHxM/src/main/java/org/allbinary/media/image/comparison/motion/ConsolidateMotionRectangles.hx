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
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;

class ConsolidateMotionRectangles extends MotionRectangles {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final NAME : String = "consolidatedMotionRectangles_";
    public function new(motionRectangles : MotionRectangles) {
        super(NAME, motionRectangles.getImageComparisonResult());
        final vector : BasicArrayList = motionRectangles.getVector();
        final size : Int = vector.size();
        for (index in 0...size) {
            var motionRectangle : MotionRectangle = (cast vector.get(index) : MotionRectangle);
            vector.add(motionRectangle.clone());
        }
        this.consolidateMotionRectangles();
    }

    private function consolidateMotionRectangles() : Void {
        final vector : BasicArrayList = this.getVector();
        this.logUtil.putF("Start - Size Before: " + vector.size(), this, "consolidateMotionRectangleConstraints");
        final removeVector : BasicArrayList = new BasicArrayListD();
        final size : Int = vector.size();
        for (index in 0...size) {
            var motionRectangle : MotionRectangle = (cast vector.get(index) : MotionRectangle);
            for (i in index + 1...vector.size()) {
                var motionRectangle2 : MotionRectangle = (cast vector.get(i) : MotionRectangle);
                var rectangle : Rectangle = motionRectangle.getRectangle();
                var rectangle2 : Rectangle = motionRectangle2.getRectangle();
                var x2 : Int = rectangle.x + rectangle.width;
                var y2 : Int = rectangle.y + rectangle.height;
                var rightX : Int = rectangle2.x + rectangle2.width;
                var bottomY : Int = rectangle2.y + rectangle2.height;
                if (rectangle.x <= rectangle2.x && rectangle.y <= rectangle2.y && x2 >= rightX && y2 >= bottomY) {
                    removeVector.add(motionRectangle2);
                }
            }
        }
        this.remove(removeVector);
    }

    private function remove(removeVector : BasicArrayList) : Void {
        final vector : BasicArrayList = this.getVector();
        final size : Int = removeVector.size();
        for (index in 0...size) {
            vector.remove(removeVector.get(index));
        }
    }

}

