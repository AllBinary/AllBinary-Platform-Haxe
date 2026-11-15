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

//import java.awt.*;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;

class ColorRange implements ColorRangeInterface {
    private var minRed : Int;
    private var maxRed : Int;
    private var minGreen : Int;
    private var maxGreen : Int;
    private var minBlue : Int;
    private var maxBlue : Int;
    public function new() {
        this.minRed = 0;
        this.maxRed = 0;
        this.minGreen = 0;
        this.maxGreen = 0;
        this.minBlue = 0;
        this.maxBlue = 0;
    }

    public function getMinRed() : Int {
        return this.minRed;
    }

    public function setMinRed(minRed : Int) : Void {
        this.minRed = minRed;
    }

    public function getMaxRed() : Int {
        return this.maxRed;
    }

    public function setMaxRed(maxRed : Int) : Void {
        this.maxRed = maxRed;
    }

    public function getMinGreen() : Int {
        return this.minGreen;
    }

    public function setMinGreen(minGreen : Int) : Void {
        this.minGreen = minGreen;
    }

    public function getMaxGreen() : Int {
        return this.maxGreen;
    }

    public function setMaxGreen(maxGreen : Int) : Void {
        this.maxGreen = maxGreen;
    }

    public function getMinBlue() : Int {
        return this.minBlue;
    }

    public function setMinBlue(minBlue : Int) : Void {
        this.minBlue = minBlue;
    }

    public function getMaxBlue() : Int {
        return this.maxBlue;
    }

    public function setMaxBlue(maxBlue : Int) : Void {
        this.maxBlue = maxBlue;
    }

    public function isInRange(color : Color) : Bool {
        if (color.getRed() >= this.getMinRed() && color.getRed() <= this.getMaxRed() && color.getGreen() >= this.getMinGreen() && color.getGreen() <= this.getMaxGreen() && color.getBlue() >= this.getMinBlue() && color.getBlue() <= this.getMaxBlue()) {
            return true;
        } else {
            return false;
        }
    }

    public function toString() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("getMinRed(): ");
        stringBuffer.appendint(this.getMinRed());
        stringBuffer.append(CommonSeps.getInstance().NEW_LINE);
        stringBuffer.append("getMaxRed(): ");
        stringBuffer.appendint(this.getMaxRed());
        stringBuffer.append(CommonSeps.getInstance().NEW_LINE);
        stringBuffer.append("getMinGreen(): ");
        stringBuffer.appendint(this.getMinGreen());
        stringBuffer.append(CommonSeps.getInstance().NEW_LINE);
        stringBuffer.append("getMaxGreen(): ");
        stringBuffer.appendint(this.getMaxGreen());
        stringBuffer.append(CommonSeps.getInstance().NEW_LINE);
        stringBuffer.append("getMinBlue(): ");
        stringBuffer.appendint(this.getMinGreen());
        stringBuffer.append(CommonSeps.getInstance().NEW_LINE);
        stringBuffer.append("getMaxBlue(): ");
        stringBuffer.appendint(this.getMaxBlue());
        return stringBuffer.toString();
    }

}

