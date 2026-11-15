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

import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;

class ColorAverage {
    private var avgRed : Float = 0.0;
    private var avgGreen : Float = 0.0;
    private var avgBlue : Float = 0.0;
    public function new() {
        this.setAvgRed(0);
        this.setAvgGreen(0);
        this.setAvgBlue(0);
    }

    public function toString() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("getAvgRed(): ");
        stringBuffer.appendfloat(this.getAvgRed());
        stringBuffer.append(CommonSeps.getInstance().NEW_LINE);
        stringBuffer.append("getAvgRed(): ");
        stringBuffer.appendfloat(this.getAvgRed());
        stringBuffer.append(CommonSeps.getInstance().NEW_LINE);
        stringBuffer.append("getAvgGreen(): ");
        stringBuffer.appendfloat(this.getAvgGreen());
        stringBuffer.append(CommonSeps.getInstance().NEW_LINE);
        return stringBuffer.toString();
    }

    public function getAvgRed() : Float {
        return this.avgRed;
    }

    public function setAvgRed(avgRed : Float) : Void {
        this.avgRed = avgRed;
    }

    public function getAvgGreen() : Float {
        return this.avgGreen;
    }

    public function setAvgGreen(avgGreen : Float) : Void {
        this.avgGreen = avgGreen;
    }

    public function getAvgBlue() : Float {
        return this.avgBlue;
    }

    public function setAvgBlue(avgBlue : Float) : Void {
        this.avgBlue = avgBlue;
    }

}

