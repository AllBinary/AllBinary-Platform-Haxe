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


class ImageColorResults {
    private var colorRange : ColorRange = null;
    private var colorAverage : ColorAverage = null;
    public function new() {
        this.setColorRange(new ColorRange());
        this.getColorRange().setMaxRed(-1);
        this.getColorRange().setMaxGreen(-1);
        this.getColorRange().setMaxBlue(-1);
        this.getColorRange().setMinRed(256);
        this.getColorRange().setMinGreen(256);
        this.getColorRange().setMinBlue(256);
        this.setColorAverage(new ColorAverage());
    }

    public function getColorRange() : ColorRange {
        return this.colorRange;
    }

    public function setColorRange(colorRange : ColorRange) : Void {
        this.colorRange = colorRange;
    }

    public function getColorAverage() : ColorAverage {
        return this.colorAverage;
    }

    public function setColorAverage(colorAverage : ColorAverage) : Void {
        this.colorAverage = colorAverage;
    }

}

