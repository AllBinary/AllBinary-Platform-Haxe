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

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.media.image.comparison.ImageComparisonResult;

class MotionRectangles {
    private final name : String;
    private var rectangleVector : BasicArrayList = null;
    private var imageComparisonResult : ImageComparisonResult = null;
    public final MAX_PIXEL_DISTANCE_THRESHOLD : Int = 2;
    public function new(name : String, imageComparisonResult : ImageComparisonResult) {
        this.name = name;
        this.setImageComparisonResult(imageComparisonResult);
        this.setVector(new BasicArrayListD());
    }

    public function getVector() : BasicArrayList {
        return this.rectangleVector;
    }

    public function setVector(rectangleVector : BasicArrayList) : Void {
        this.rectangleVector = rectangleVector;
    }

    public function getName() : String {
        return this.name;
    }

    public function getImageComparisonResult() : ImageComparisonResult {
        return this.imageComparisonResult;
    }

    public function setImageComparisonResult(imageComparisonResult : ImageComparisonResult) : Void {
        this.imageComparisonResult = imageComparisonResult;
    }

}

