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
package org.allbinary.media.image.analysis;


class ImageAnalysisResults {
    private var imageColorRangeResults : ImageColorRangeResults;
    private var imageColorResults : ImageColorResults;
    private var averageAmbientLevel : Float = 0.0;
    public function new() {
        this.imageColorRangeResults = new ImageColorRangeResults();
        this.imageColorResults = new ImageColorResults();
    }

    public function getImageColorRangeResults() : ImageColorRangeResults {
        return this.imageColorRangeResults;
    }

    public function setImageColorRangeResults(imageColorRangeResults : ImageColorRangeResults) : Void {
        this.imageColorRangeResults = imageColorRangeResults;
    }

    public function getAverageAmbientLevel() : Float {
        return this.averageAmbientLevel;
    }

    public function setAverageAmbientLevel(averageAmbientLevel : Float) : Void {
        this.averageAmbientLevel = averageAmbientLevel;
    }

    public function getImageColorResults() : ImageColorResults {
        return this.imageColorResults;
    }

    public function setImageColorResults(imageColorResults : ImageColorResults) : Void {
        this.imageColorResults = imageColorResults;
    }

}

