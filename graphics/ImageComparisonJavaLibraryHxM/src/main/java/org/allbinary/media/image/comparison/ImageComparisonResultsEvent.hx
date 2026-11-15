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
package org.allbinary.media.image.comparison;

import org.allbinary.logic.util.event.AllBinaryEventObject;

class ImageComparisonResultsEvent extends AllBinaryEventObject {
    private var imageComparisonResult : ImageComparisonResult = null;
    public function new(anyType : Any, imageComparisonInfo : ImageComparisonResult) {
        super(anyType);
        this.setImageComparisonResult(imageComparisonInfo);
    }

    public function getImageComparisonResult() : ImageComparisonResult {
        return this.imageComparisonResult;
    }

    public function setImageComparisonResult(imageComparisonResult : ImageComparisonResult) : Void {
        this.imageComparisonResult = imageComparisonResult;
    }

}

