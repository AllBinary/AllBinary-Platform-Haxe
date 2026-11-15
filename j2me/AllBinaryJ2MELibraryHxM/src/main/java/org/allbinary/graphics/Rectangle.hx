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
package org.allbinary.graphics;

import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonSeps;

class Rectangle {
    private var point : GPoint;
    private var width : Int;
    private var height : Int;
    public function new(point : GPoint, width : Int, height : Int) {
        this.point = point;
        this.width = width;
        this.height = height;
    }

    public function getPoint() : GPoint {
        return this.point;
    }

    public function setPoint(point : GPoint) : Void {
        this.point = point;
    }

    public function getMaxX() : Int {
        return this.point.getX() + this.width;
    }

    public function getMaxY() : Int {
        return this.point.getY() + this.height;
    }

    public function getWidth() : Int {
        return this.width;
    }

    public function setWidth(width : Int) : Void {
        this.width = width;
    }

    public function getHeight() : Int {
        return this.height;
    }

    public function setHeight(height : Int) : Void {
        this.height = height;
    }

    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(Std.string(this.getPoint()));
        stringBuffer.append(CommonSeps.getInstance().SPACE);
        stringBuffer.append(CommonLabels.getInstance().WIDTH_LABEL);
        stringBuffer.appendint(this.getWidth());
        stringBuffer.append(CommonSeps.getInstance().SPACE);
        stringBuffer.append(CommonLabels.getInstance().HEIGHT_LABEL);
        stringBuffer.appendint(this.getHeight());
        stringBuffer.append(" MaxX: ");
        stringBuffer.appendint(this.getMaxX());
        stringBuffer.append(" MaxY: ");
        stringBuffer.appendint(this.getMaxY());
        return Std.string(stringBuffer);
    }

}

