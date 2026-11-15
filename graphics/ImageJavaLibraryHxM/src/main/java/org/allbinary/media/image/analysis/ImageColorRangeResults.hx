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


class ImageColorRangeResults {
    private var colorRangeInterface : ColorRangeInterface = null;
    private var matchingPixelsChecked : haxe.Int64 = haxe.Int64.ofInt(0);
    private var totalPixelsChecked : haxe.Int64 = haxe.Int64.ofInt(0);
    public function new() {
        this.setColorRangeInterface((cast new ColorRange() : ColorRangeInterface));
    }

    public function getColorRangeInterface() : ColorRangeInterface {
        return this.colorRangeInterface;
    }

    public function setColorRangeInterface(colorRangeInterface : ColorRangeInterface) : Void {
        this.colorRangeInterface = colorRangeInterface;
    }

    public function getMatchingPixelsChecked() : haxe.Int64 {
        return this.matchingPixelsChecked;
    }

    public function setMatchingPixelsChecked(matchingPixelsChecked : haxe.Int64) : Void {
        this.matchingPixelsChecked = matchingPixelsChecked;
    }

    public function addMatchingPixelsChecked() : Void {
        this.matchingPixelsChecked++;
    }

    public function getTotalPixelsChecked() : haxe.Int64 {
        return this.totalPixelsChecked;
    }

    public function addTotalPixelsChecked() : Void {
        this.totalPixelsChecked++;
    }

    public function setTotalPixelsChecked(totalPixelsChecked : haxe.Int64) : Void {
        this.totalPixelsChecked = totalPixelsChecked;
    }

    public function getPercent() : Float {
        return (haxe.Int64.toInt(this.getMatchingPixelsChecked()) / haxe.Int64.toInt(this.getTotalPixelsChecked()));
    }

}

