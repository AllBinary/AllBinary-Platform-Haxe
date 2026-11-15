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
package org.allbinary.media.graphics.geography.map;

import org.allbinary.graphics.CellPosition;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.PointFactory;

class GeographicMapCellPosition extends CellPosition {
    private var point : GPoint;
    private var midPoint : GPoint;
    public function new(column : Int, row : Int, columns : Int, rows : Int, width : Int, height : Int) {
        super(column, row, columns, rows);
        var x : Int = this.getColumn() * width;
        var y : Int = this.getRow() * height;
        final pointFactory : PointFactory = PointFactory.getInstance();
        this.point = pointFactory.createXY(x, y);
        this.midPoint = pointFactory.createXY(x + (width >> 1), y + (height >> 1));
    }

    public function getPoint() : GPoint {
        return this.point;
    }

    public function getMidPoint() : GPoint {
        return this.midPoint;
    }

    public function setMidPoint(midPoint : GPoint) : Void {
        this.midPoint = midPoint;
    }

}

