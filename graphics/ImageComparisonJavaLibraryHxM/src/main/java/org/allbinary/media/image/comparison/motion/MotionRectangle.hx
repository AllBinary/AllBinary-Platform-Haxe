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
//import java.util.Vector;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class MotionRectangle implements Cloneable {
    private var rectangle : Rectangle = null;
    private var pixelDeltaVector : BasicArrayList = null;
    public function new(rectangle : Rectangle) {
        this.setRectangle(rectangle);
        this.setPixelDeltaVector(new BasicArrayListD());
    }

    public function getRectangle() : Rectangle {
        return this.rectangle;
    }

    public function setRectangle(rectangle : Rectangle) : Void {
        this.rectangle = rectangle;
    }

    public function getPixelDeltaVector() : BasicArrayList {
        return this.pixelDeltaVector;
    }

    public function setPixelDeltaVector(pixelDeltaVector : BasicArrayList) : Void {
        this.pixelDeltaVector = pixelDeltaVector;
    }

    public function clone() : Any {
        var motionRectangle : MotionRectangle = new MotionRectangle((cast this.getRectangle().clone() : Rectangle));
        motionRectangle.setPixelDeltaVector((cast this.getPixelDeltaVector().clone() : BasicArrayList));
        return motionRectangle;
    }

}

